From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Thu, 11 Aug 2016 10:43:04 +0000
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160808223407.4f535efd@free-electrons.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
 <1470671781.31195.45.camel@synopsys.com>
 <20160808223407.4f535efd@free-electrons.com>
Message-ID: <1470912183.20896.30.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,?

writing you about stella-4.7.2 failure for ARC as I promised.?
Following patch fixes it:
https://patchwork.ozlabs.org/patch/658158/

Few words about this failure. The real bug wasn't evident for me for long time - I was unable to reproduce the issue on my build host.
On your side x86_64-linux-gnu-g++ compiler was chosen by stella configure script because:
1) check of arc-buildroot-linux-uclibc-g++ compiler failed due to bad configure script logic,
2) for some reason script doesn't fail but try to find another compiler. This is performed with help of config.guess script. config.guess
script is used to determine your host arch and os. The result is x86_64 and linux-gnu on your side.
3) so, it tries x86_64-linux-gnu toolchain.


The errors like:
> Looking for C++ compiler... ./configure: line 110: eval: -g:
> invalid option eval: usage: eval [arg ...]?
> ./configure: line 110: eval: -c: invalid option
> eval: usage: eval [arg ...] ?
appear when script is not able to find any suitable toolchains.
For example it happened to me - I have?x86_64-redhat-linux-g++ instead of x86_64-linux-gnu-g++ on my host.
So the script wasn't able to find suitable compiler.

And what is really funny - configure script doesn't exit in such case.?
It leaves the first possible value in $CXX variable (arc-buildroot-linux-uclibc-g++ in case of ARC).
Because of such behavior configure dind't fail to me and correct arc-buildroot-linux-uclibc-g++ was chosen somehow (even though the script
decided it is not suitable for build), and package was build successfully.

Eventually though build the package is fixed by my patch I still keep in mind two following problems:

1) Why should we try to build for other platform if specified toolchain is not suitable?
2) Why configure script doesn't stop the build when it is unable to fond correct toolchain?

What do you think about it?

Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>

On Mon, 2016-08-08 at 22:34 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 8 Aug 2016 15:56:21 +0000, Vlad Zakharov wrote:
> 
> > 
> > The failures listed above occurred due to the same issue -
> > crtbeginT.o file was missing as the corresponding dependency wasn't
> > added. The issue has already been solved internally and will be
> > included in our next engineering build. We hope that new build happen
> > tomorrow or the day after tomorrow. Anyway we will send patch patch
> > with bumping to new arc toolchain as soon as it will come up.
> OK, thanks!
> 
> > 
> > > 
> > > > 
> > > > Looking for C++ compiler... ./configure: line 110: eval: -g:
> > > > invalid option eval: usage: eval [arg ...]
> > > > ./configure: line 110: eval: -c: invalid option
> > > > eval: usage: eval [arg ...]??
> > > ??
> > I am looking at this issue now. I will report about it ASAP.
> Perfect, thanks!
> 
> Thomas
