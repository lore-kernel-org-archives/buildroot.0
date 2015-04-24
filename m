From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 24 Apr 2015 21:29:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: fix musl compile
In-Reply-To: <87y4lhrfnq.fsf@dell.be.48ers.dk>
References: <1429830746-30309-1-git-send-email-joerg.krause@embedded.rocks>
 <87y4lhrfnq.fsf@dell.be.48ers.dk>
Message-ID: <1429903782.1945.68.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fr, 2015-04-24 at 12:20 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
>  > Expand existing rpmatch() patch for uClibc to musl. Add another 
> patch to
>  > fix more compile issues with musl.
> 
>  > Patches sent upstream:
>  > 1) "include/common.h: fix build against musl"
>  >    [http://patchwork.ozlabs.org/patch/464074/]
>  > 2) "Makefile: fix build against musl"
>  >    [http://patchwork.ozlabs.org/patch/464072/]
>  > 3) "lib/libfec.c: fix build against musl"
>  >    [http://patchwork.ozlabs.org/patch/464073/]
> 
> Thanks, but something seems wrong:

Thanks for testing!

> 
> > +uClibc defines both __UCLIBC__ and __GLIBC__. So first check for 
> > uCibc and its
>  > +version and then for a non glibc implementation (like musl). 
> Note, musl does
>  > +not define __MUSL__.
>  > +
>  > +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>  > +
>  >  Cc: Mike Frysinger <vapier@gentoo.org>
>  >  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>  >  ---
>  >   include/common.h | 14 ++++++++++++++
>  >   1 file changed, 14 insertions(+)
>  
>  >  diff --git a/include/common.h b/include/common.h
>  > -index 4ffccea17213..838dc757bdf1 100644
>  > +index 4ffccea..d1be21e 100644
>  >  --- a/include/common.h
>  >  +++ b/include/common.h
>  >  @@ -102,6 +102,20 @@ extern "C" {
>  > -  fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, 
> ##__VA_ARGS__); \
>  > - } while(0)
>  > - 
>  > -+#if defined(__UCLIBC__)
>  > -+/* uClibc versions before 0.9.34 don't have rpmatch() */
>  > -+#if __UCLIBC_MAJOR__ == 0 && \
>  > +  fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, 
> ##__VA_ARGS__); \
>  > +} while(0)
>  > +
> 
> This is not valid patch syntax (context lines should start with a
> space). Perhaps you mailed corrupted the patch?

Oops, something went terribly wrong here when removing trailing
whitespaces, I guess. Fixed.

> 
> With that fixed, it still doesn't build for me:
> 
>   CC      recv_image.o
> recv_image.c:7:19: fatal error: error.h: No such file or directory
>  #include <error.h>
>                    ^
> compilation terminated.
> common.mk:82: recipe for target 
> '/home/peko/source/buildroot/output/build/mtd-1.5.1/recv_image.o' 
> failed
> 
> Care to fix that and resend?

I see, this happens for the recv_image tool. I just tested the default
enabled tools.

Yes, I will fix that.

Best regards
J?rg Krause
