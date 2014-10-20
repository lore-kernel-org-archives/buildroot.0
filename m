From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 10:34:09 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <20141020152759.4f438890@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>	<20141020150209.5f8b45a5@free-electrons.com>	<54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
Message-ID: <54450F51.5050801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 10:27 AM, Thomas Petazzoni wrote:

> Well, it's just that I still have my pet project of graphing the size
> installed by each package. And for this, every file not installed by a
> package is a bit annoying, as we don't know to which package we should
> account the installation of the file.

You've got bigger fish to care about before this tiny file, like
COPY_GCONV_LIBS in toolchain/toolchain.mk, or:

gustavoz at asgard ~/git/buildroot/package $ find . -name \*.mk -exec grep
--with-filename TARGET_FINALIZE {} \;
./perl/perl.mk:TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
./luarocks/luarocks.mk:TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
./google-breakpad/google-breakpad.mk:TARGET_FINALIZE_HOOKS +=
GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
./python/python.mk:TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
./python3/python3.mk:TARGET_FINALIZE_HOOKS += PYTHON3_FINALIZE_TARGET

Besides it's a file that in essence belongs to skeleton, just
conditional on (e)glibc.
You'll have to deal with the other skeleton files as well IMHO, just
treat is as such.
(negative logic could be used, remove if it's not needed, but i don't
think it'll change anything WRT your pet project).
Regards.
