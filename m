From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 19:32:51 +0100
Subject: [Buildroot] [PATCH 5/7] freetype: host-freetype-patch requires
	host-automake
In-Reply-To: <20150227152825.00c67240@free-electrons.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-6-git-send-email-fabio.porcedda@gmail.com>
 <20150227152825.00c67240@free-electrons.com>
Message-ID: <CAHkwnC-TM4LbSuD86wy0P2Kjpg53miKPDSbyz3Yv+a3BAoG0LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 27, 2015 at 3:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 27 Feb 2015 10:19:22 +0100, Fabio Porcedda wrote:
>> The "make host-freetype-patch" fails because using the autogen.sh script
>> it doesn't found the autoconf tool, the problem was already fixed for
>> "make freetype-patch" adding the "host-automake" as a prerequisite to
>> freetype-patch, so fix it by adding "host-automake" as a prerequisite to
>> "host-freetype-patch" too.
>>
>> Fix build failure:
>> running `autoconf --force'
>> ./autogen.sh: line 15: autoconf: command not found
>> error while running `autoconf --force'
>> package/pkg-generic.mk:146: recipe for target 'buildroot/output/build/host-freetype-2.5.5/.stamp_patched' failed
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Maybe this has been discussed before, but why are we doing the autogen
> in a post patch hook rather than in a pre-configure hook ?

Inside the freetype.mk file there is a comment about that:

# POST_PATCH is because we still need to patch libtool after the regen.

The message and hook was added in this commit:

 commit a31a66802a7a1af76a629b0ba7120424ed547646
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Tue Apr 22 14:12:40 2014 -0300

    freetype: security bump to version 2.5.3

    Fixes CVE-2014-2240.

I've tried to use a PRE_CONFIGURE hook but it fails:

>>> host-freetype 2.5.5 Patching
>>> host-freetype 2.5.5 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/fabiopo/buildroot/br/output/build/host-freetype-2.5.5 -name
$file); do cp support/gnuconfig/$file $i; done; done
>>> host-freetype 2.5.5 Patching libtool

Applying buildroot-libtool-v2.4.patch using patch:
patching file ltmain.sh
Hunk #1 FAILED at 1417.
Hunk #2 FAILED at 2963.
Hunk #3 FAILED at 5176.
Hunk #4 succeeded at 6537 (offset 1352 lines).
Hunk #5 succeeded at 6825 with fuzz 1 (offset 1358 lines).
Hunk #6 succeeded at 7112 (offset 1363 lines).
Hunk #7 succeeded at 8055 with fuzz 2 (offset 1363 lines).
Hunk #8 succeeded at 10647 (offset 1377 lines).
3 out of 8 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool-v2.4.patch!

BR
-- 
Fabio Porcedda
