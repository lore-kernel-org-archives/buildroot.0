From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 30 Jun 2014 09:57:12 +0200
Subject: [Buildroot] [PATCH] infra: simplify .la/.pc fixup commands
In-Reply-To: <db45345a-04e3-4b00-95dc-361c43d347c6@email.android.com>
References: <6d38fb9f8bb567d8a4a2.1404044185@localhost>
 <20140629161538.35a3c17c@free-electrons.com>
 <26ee94e3-9322-47ba-881d-d48edc8d6568@email.android.com>
 <20140629164849.737e8c26@free-electrons.com>
 <db45345a-04e3-4b00-95dc-361c43d347c6@email.android.com>
Message-ID: <CAAXf6LWe2ouAp2GDv05S0iW=CKapdPe21fOnK3EQfcMF1yepPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jun 29, 2014 at 5:42 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>>Dear Thomas De Schampheleire,
>>
>>On Sun, 29 Jun 2014 16:47:27 +0200, Thomas De Schampheleire wrote:
>>
>>> >Is this assumption really correct? If the user decides to move
>>> >$(HOST_DIR) in some custom location using BR2_HOST_DIR, it also means
>>> >that $(STAGING_DIR) is moved to this custom location. So you can have a
>>> >case where:
>>> >
>>> >    BASE_DIR = /home/joe/buildroot/output
>>> >    HOST_DIR = /opt/arm-build
>>> >    STAGING_DIR = /opt/arm-build/usr/arm-unknown-linux-uclibcgnueabi/sysroot/
>>> >
>>> >No ?
>>>
>>> Hmm, ok, but I'm this case the already applied patch is not complete either and we should go back to v2 I think... I'll resubmit...
>>>
>>> ...and I blame Arnout ;-)
>>
>>Well, I don't know, I haven't tested nor mentally executed your sed
>>expressions with the use case above in mind, so I don't know if the
>>patch is actually broken or not. But if you assume that STAGING_DIR is
>>a subdir of BASE_DIR, I believe it's not a valid assumption, as
>>explained above.
>
> I think the patch is effectively broken due to this assumption. I will send a more detailed mail later with some sed commands on examples. This should clarify things...

Let me try to clarify the different sed commands on an example.

tdescham at argentina ~ $ cat /tmp/testfile
1=/usr/foo                                 # unprefixed
2=/usr/buildroot/output/sysroot/usr/foo    # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

The goal of the sed command is to change the first line to include the
staging dir, and not touch any of the others.
There are two versions of my patch relevant here: v3 is the currently
committed version and implicitly assumes that STAGING_DIR always
contains BASE_DIR (which is so by default but as ThomasP pointed out
is not always true). The earlier v2 did not make this assumption and
treated BASE_DIR and STAGING_DIR separately.

For the record:
BASE_DIR = <buildroot>/output
but can be overwritten with O=xxx

HOST_DIR := $(BASE_DIR)/host
HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)

So STAGING_DIR is by default under BASE_DIR, but this can be changed
with BR2_HOST_DIR.

The sed commands in the two patch versions:

tdescham at argentina ~ $ cat /tmp/sedv2
#!/bin/sh
sed -e "s:$BASE_DIR:@BASE_DIR@:g" \
    -e "s:$STAGING_DIR:@STAGING_DIR@:g" \
    -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
    -e "s:@STAGING_DIR@:$STAGING_DIR:g" \
    -e "s:@BASE_DIR@:$BASE_DIR:g"
tdescham at argentina ~ $ cat /tmp/sedv3
#!/bin/sh
sed -e "s:$BASE_DIR:@BASE_DIR@:g" \
    -e "s:\(['= ]\)/usr:\\1$STAGING_DIR/usr:g" \
    -e "s:@BASE_DIR@:$BASE_DIR:g"


When buildroot is not in /usr, there was never a problem, not with the
original code nor with the adapted (v2 or v3).

tdescham at argentina ~ $ BASE_DIR=/home/buildroot/output
STAGING_DIR=$BASE_DIR/sysroot /tmp/sedv2 < /tmp/testfile
1=/home/buildroot/output/sysroot/usr/foo
  # unprefixed
2=/home/buildroot/output/sysroot/usr/buildroot/output/sysroot/usr/foo
  # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

tdescham at argentina ~ $ BASE_DIR=/home/buildroot/output
STAGING_DIR=$BASE_DIR/sysroot /tmp/sedv3 < /tmp/testfile
1=/home/buildroot/output/sysroot/usr/foo
  # unprefixed
2=/home/buildroot/output/sysroot/usr/buildroot/output/sysroot/usr/foo
  # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

In both cases, line 1 is correctly prefixed, line 2 is double-prefixed
which is normal because it starts with /usr but does not start with
BASE_DIR nor STAGING_DIR, line 3 and 4 are correctly untouched.


When buildroot is placed in /usr, things went wrong originally, but
both patch v2 and v3 solve this:

tdescham at argentina ~ $ BASE_DIR=/usr/buildroot/output
STAGING_DIR=$BASE_DIR/sysroot /tmp/sedv2 < /tmp/testfile
1=/usr/buildroot/output/sysroot/usr/foo
 # unprefixed
2=/usr/buildroot/output/sysroot/usr/foo    # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

tdescham at argentina ~ $ BASE_DIR=/usr/buildroot/output
STAGING_DIR=$BASE_DIR/sysroot /tmp/sedv3 < /tmp/testfile
1=/usr/buildroot/output/sysroot/usr/foo
 # unprefixed
2=/usr/buildroot/output/sysroot/usr/foo    # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

In both cases, line 1 is correctly prefixed, and all other lines are
left untouched.


Now, what happens if STAGING_DIR is not inside BASE_DIR, for example
BASE_DIR is in home but STAGING_DIR is in /usr:

tdescham at argentina ~ $ BASE_DIR=/home/buildroot/output
STAGING_DIR=/usr/buildroot/output/sysroot /tmp/sedv2 < /tmp/testfile
1=/usr/buildroot/output/sysroot/usr/foo
 # unprefixed
2=/usr/buildroot/output/sysroot/usr/foo    # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

tdescham@argentina ~ $ BASE_DIR=/home/buildroot/output
STAGING_DIR=/usr/buildroot/output/sysroot /tmp/sedv3 < /tmp/testfile
1=/usr/buildroot/output/sysroot/usr/foo
 # unprefixed
2=/usr/buildroot/output/sysroot/usr/buildroot/output/sysroot/usr/foo
 # prefixed, usr path
3=/home/buildroot/output/sysroot/usr/foo   # prefixed, 'normal' path
4=/bar                                     # dummy

v2 correctly prefixes line 1 and leaves the other untouched.
v3 falls back to the original incorrect case and double-prefixes line 2.


So the bottom line of this is that we should go back to the v2 handling.
I'll submit a new patch...

Best regards,
Thomas
