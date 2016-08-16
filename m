From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Aug 2016 16:11:54 +0200
Subject: [Buildroot] [PATCH 2/2] tinycbor: fix issue on unnamed union
In-Reply-To: <87fuq5xnt4.fsf@dell.be.48ers.dk>
References: <1471290845-115279-1-git-send-email-fabrice.fontaine@orange.com>
 <1471290845-115279-2-git-send-email-fabrice.fontaine@orange.com>
 <87fuq5xnt4.fsf@dell.be.48ers.dk>
Message-ID: <39A58E7A-0045-4782-AE36-3BB3DF6D42D7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

It seems that the link you provided is not correct as in this build, the old tinycbor 0.3.1 is being compiled. Could you provide me the correct link so I can reproduce the issue? I suspect you encountered a totally new issue with src/open_memstream.c which is being compiled only if open_memstream is found in the toolchain but this file is also using fopencookie which does not seem to be available in the toolchain. If I can reproduce the issue, I will make a new patch to check the presence of fopencookie an send it upstream.

Concerning your original question, tinycbor 0.3.2 includes directly the patch from Thomas, more details can be found her: https://github.com/01org/tinycbor/commit/31c7f81d45d115d2007b1c881cbbd3a19618465c.

The second patch removes the unnamed union, more details can be found here: https://patchwork.ozlabs.org/patch/652187/.

Best regards,

Fabrice

Le 16 ao?t 2016 ? 07:52, Peter Korsgaard <peter@korsgaard.com> a ?crit :

>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>> Until tinycbor 0.4 is released, patch from dev branch is needed to
>> remove the usage of unnamed union which are not supported by all
>> targets such as blackfin
> 
> What autobuilder issues does this fix?
> 
> I tried building this config after applying both patches:
> 
> http://autobuild.buildroot.net/results/f4d/f4d15afb44f471878dbdee7c67cd836bd2b79904/
> 
> But it now fails with:
> 
> src/open_memstream.c: In function ?open_memstream?:
> src/open_memstream.c:105: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?vtable?
> src/open_memstream.c:105: error: ?vtable? undeclared (first use in this function)
> src/open_memstream.c:105: error: (Each undeclared identifier is reported only once
> src/open_memstream.c:105: error: for each function it appears in.)
> src/open_memstream.c:105: error: expected expression before ?{? token
> src/open_memstream.c:111: warning: implicit declaration of function ?fopencookie?
> src/open_memstream.c:111: warning: return makes pointer from integer without a cast
> Makefile:198: recipe for target 'src/open_memstream.o' failed
> 
> So it isn't much of an improvement. Does it fix any other autobuilder issues?
> 
> -- 
> Bye, Peter Korsgaard
