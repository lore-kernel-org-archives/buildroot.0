From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 21 Oct 2015 16:42:59 +0100
Subject: [Buildroot] [PATCH] openpgm: bump to version release-5-2-122
In-Reply-To: <20151021171553.52fcee58@free-electrons.com>
References: <1445435791-40706-1-git-send-email-Vincent.Riera@imgtec.com>
 <56279A94.8010809@imgtec.com> <20151021171553.52fcee58@free-electrons.com>
Message-ID: <5627B283.80904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/21/2015 04:15 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 21 Oct 2015 15:00:52 +0100, Vicente Olivert Riera wrote:
>> On 10/21/2015 02:56 PM, Vicente Olivert Riera wrote:
>> [snip]
>>> - Run the bootstrap.sh script it fails to autoreconf properly
>> - Run the bootstrap.sh script; it fails to autoreconf properly
> 
> I quickly looked at the bootstrap.sh script, and besides the messages in
> Japanese (or what I guessed to be Japanese), nothing really unusual
> stands out. What fails if you just have AUTORECONF = YES ?

This is the failure:

>>> openpgm release-5-2-122 Configuring
>>> openpgm release-5-2-122 Autoreconfiguring
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: /br/output/host/usr/bin/aclocal failed with exit status: 1

With AUTORECONF = YES, we start running aclocal. I think it normally
starts running libtoolize, but since the m4 directory doesn't exist, it
starts directly with aclocal.

With the bootstrap script work because it will call libtoolize despite
of the m4 directory not existing.

If you prefer, this approach also works, although libtoolize is ran
twice (first by the hook, and then by autoreconf):

(I keep the line numbers to preserve the indentation)

13 OPENPGM_AUTORECONF = YES
14
15 # we need to run libtoolize before autoreconf, so the missing m4
16 # directory is created.
17 define OPENPGM_LIBTOOLIZE
18         cd $(@D)/$(OPENPGM_SUBDIR) && PATH=$(BR_PATH) libtoolize
19 endef
20 OPENPGM_PRE_CONFIGURE_HOOKS += OPENPGM_LIBTOOLIZE

Regards,

Vincent.

> 
> Thomas
> 
