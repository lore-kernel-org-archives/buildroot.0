From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 16 Nov 2012 09:07:55 +0000
Subject: [Buildroot] [git commit] lcdproc: fix autobuilder failures
In-Reply-To: <20121116004452.635cf645@skate>
References: <20121115230738.33E869A031@busybox.osuosl.org>
 <20121116004452.635cf645@skate>
Message-ID: <CAHt8ZCNQwhHyxiVy5pMtq5KJnYKS2RHm=0sOPp2VH5s7BePF3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 November 2012 23:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Looking at the build failure (which got triggered again today), I am a
> bit suspicious about this fix. The build failure is:
>
> /scratch/peko/host/usr/bin/ccache /scratch/peko/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I/scratch/peko/host/usr/include/freetype2 -I/scratch/peko/host/usr/include   -fPIC -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-unused-function -shared  -o glcd.so glcd-glcd_drv.o glcd-glcd-render.o libLCD.a  glcd-t6963.o t6963_low.o -L/scratch/peko/host/usr/lib -lfreetype -lz -lbz2    -ldl
> /scratch/peko/host/usr/lib/libfreetype.so: file not recognized: File format not recognized
>
> The problem here is not a missing dependency on freetype, but rather
> the fact that we have -I and -L options pointing to host headers and
> libraries, while we are building something on the target. So maybe
> adding freetype and zlib as dependencies work around the problem, but I
> suspect that those wrong -I and -L lines might still be there, no?

Hi Thomas.

If lcdproc finds freetype in the staging area, then the host header
and library search paths do not get added to the build commands. So I
think this patch does more than simply work around the problem.

Simon.
