From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Dec 2016 17:55:02 +0100
Subject: [Buildroot] [PATCH 2/2] package/aespipe: fix host compile
In-Reply-To: <20161217155904.4d5b4511@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 17 Dec 2016 15:59:04 +0100")
References: <20161217071659.3975-1-bernd.kuhls@t-online.de>
 <20161217071659.3975-2-bernd.kuhls@t-online.de>
 <20161217155904.4d5b4511@free-electrons.com>
Message-ID: <87inqia42h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 17 Dec 2016 08:16:59 +0100, Bernd Kuhls wrote:

 >> +HOST_AESPIPE_CONF_ENV = \
 >> +	CFLAGS="$(HOST_CFLAGS) -no-pie" \
 >> +	LDFLAGS="$(HOST_LDFLAGS) -no-pie"

 > I reverted this patch as it breaks the build on systems where gcc does
 > not understand -no-pie:

 >   http://autobuild.buildroot.net/?reason=host-aespipe-2.4d

Crap, so the option is also a Debian specific change? :/

 > A better solution is needed for this problem.

We could do something like the kernel's cc-option to see if HOSTCC
accepts -no-pie - And if so, unconditionally add it to HOST_CFLAGS /
HOST_LDFLAGS.

cc-option is defined in scripts/Kbuild.include:

# cc-option
# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)

cc-option = $(call try-run,\
        $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))

-- 
Bye, Peter Korsgaard
