From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Nov 2017 13:17:42 +0100
Subject: [Buildroot] [PATCH 3/4] luajit: only available on x86(-64) hosts
In-Reply-To: <20171102120423.0f8e5ef7@windsurf> (Thomas Petazzoni's message of
 "Thu, 2 Nov 2017 12:04:23 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-4-peter@korsgaard.com>
 <20171102120423.0f8e5ef7@windsurf>
Message-ID: <87bmkj5zfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +	# -m32 flag is used for 32bit builds and host-luajit has
 >> +	# limited architecture support
 >> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 >> default y if BR2_i386 || \
 >> (BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 >> BR2_powerpc || BR2_arm || BR2_armeb || \

 > How is this going to prevent other packages from depending on
 > host-luajit. BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is all about the target
 > variant of luajit, not the host variant.

Correct.

 > Do we need a BR2_PACKAGE_HOST_LUAJIT_ARCH_SUPPORTS or something like
 > that ?

 > For example, if you enable moarvm, host-luajit will be built, but not
 > luajit.

Ahh, I had missed moarvm. Moarvm seems quite special as no other
packages need host-luajit but no luajit on the target.

Looking at the upstream project, it doesn't seem to explicitly need
host-luajit, just host-lua would do. From Configure.pl:

=item --lua=path/to/lua/executable
Path to a lua executable. (Used during the build when JIT is enabled).

This configure option is even dropped in 2017.10 with the following
information in the changelog:

+ Removal of Configure.pl --lua and --has-dynasm options, compiling with these
included 3rdparty libs is now required

Where the embedded lua copy is a tweaked lua-5.1.5:

https://github.com/MoarVM/dynasm/blob/d84e11714c9460bbb032de6cb1e06c3cb1c31f07/minilua.c

And indeed, moarvm still builds if moarvm.mk is changed to pull in
host-lua and the --lua path is adjusted. Francois, is there a specific
reason you went with host-luajit over host-lua?

So I would prefer to do that change instead of adding
BR2_PACKAGE_HOST_LUAJIT_ARCH_SUPPORTS.

I'll send a patch for moarvm.

-- 
Bye, Peter Korsgaard
