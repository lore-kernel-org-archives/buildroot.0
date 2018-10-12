From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 12 Oct 2018 06:11:51 +0000
Subject: [Buildroot] pppd - fails to build on current git.
In-Reply-To: <20181011162554.7e5f92a4@windsurf>
References: <414f8bfe86f14594b5433f40b56bde6d@WETSRVEX02.loepfe.com>
 <20181011162554.7e5f92a4@windsurf>
Message-ID: <056de4ffae5046e29f42c0c45f8e2de4@WETSRVEX02.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

pppd, at this time I quickly hacked together a patch based on the "host-ruby-patch" ... it builds, but... not tested yet.

If I find some time I might try to use the " https://github.com/paulusmack/ppp/issues/93" solution , which clearly seems to be 'cleaner'


Regards Noel



_______________________
Noel Vellemans
BMSvision
-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at bootlin.com] 
Sent: Thursday, October 11, 2018 4:26 PM
To: Vellemans, Noel
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] pppd - fails to build on current git.

Hello,

On Thu, 11 Oct 2018 12:25:17 +0000, Vellemans, Noel wrote:

> pppd fails to build on current git-snapshot.

Indeed:

  http://autobuild.buildroot.net/?reason=pppd%

> pppcrypt.c: In function 'DesSetkey':
> pppcrypt.c:122:2: warning: implicit declaration of function 'setkey'; did you mean 'DesSetkey'? [-Wimplicit-function-declaration]
>   setkey((const char *)crypt_key);
>   ^~~~~~
>   DesSetkey
> pppcrypt.c: In function 'DesEncrypt':
> pppcrypt.c:137:2: warning: implicit declaration of function 'encrypt'; did you mean 'crypt'? [-Wimplicit-function-declaration]
>   encrypt((char *)des_input, 0);
>   ^~~~~~~
>   crypt
> ...
> pppcrypt.o: In function `DesSetkey':
> pppcrypt.c:(.text+0x140): undefined reference to `setkey'
> pppcrypt.o: In function `DesEncrypt':
> pppcrypt.c:(.text+0x184): undefined reference to `encrypt'
> pppcrypt.o: In function `DesDecrypt':
> pppcrypt.c:(.text+0x1dc): undefined reference to `encrypt'
> collect2: error: ld returned 1 exit status
> Makefile:217: recipe for target 'pppd' failed
> make[3]: *** [pppd] Error 1
> Makefile:13: recipe for target 'all' failed
> 
> ==============================================================
> 
> 
> Probably based on ongoing work as stated here : 
> https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
> "The function prototypes for crypt and encrypt are removed from 
> unistd.h, and the function prototype for setkey is removed from stdlib.h"

glibc 2.28 removed libcrypt, and there are patches floating around that make pppd use openssl instead:

  https://github.com/paulusmack/ppp/issues/93

Perhaps you could re-use this to fix the issue ?

Thanks,

Thomas Petazzoni
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
