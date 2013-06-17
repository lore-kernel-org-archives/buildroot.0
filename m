From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Mon, 17 Jun 2013 17:10:39 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <51BEAB3A.8010408@mind.be>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
Message-ID: <kpmcpb$lbo$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Are we talking about the cross binutils (i.e the one that runs on your
> development PC and generates code for your target platform), or the
> target binutils (i.e the one that runs on your target platform and
> generates code for your target platform) ?

I'm not entirely sure.  I can run "make binutils" to cause the error, so I'm 
assuming it must be target binutils.  But then that doesn't make sense, 
because I have not configured buildroot to compile binutils for my target 
platform (BR2_PACKAGE_BINUTILS=n).

There is a file buildroot/build/host-binutils-2.23.2/.stamp_built so I am 
guessing that means the cross binutils worked.  So I am not sure why it is 
trying to compile target binutils?

Here's my buildroot config if it helps: 
<http://www.shikadi.net/files/buildroot/2013-06-17.br.binutils_elf2flt_err.config>

Be warned there are a couple of new options in there I have added myself.

Arnout Vandecappelle wrote:
>   elf2flt already depends on binutils (it uses libbfd), so this won't work.
> And as Thomas mentioned, this is only relevant for target-binutils (which you
> probably don't even need).

Hmm yes, since I'm not producing BFLT binaries (as they will run on the host) 
I can see that I should not be specifying these options.  However since the 
host/cross binutils builds successfully, it seems that part is working.

>   However, it looks like there is no explicit dependency on elf2flt when
> building the toolchain. Probably elf2flt should be added to BASE_TARGETS, to
> make sure it gets built before all the rest.

Would this mean elf2flt gets built before the target binutils, should I choose 
to enable it?  I am guessing that is what needs to happen for this to work 
correctly, assuming target binutils should be built.

Many thanks,
Adam.
