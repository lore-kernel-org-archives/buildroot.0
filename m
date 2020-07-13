From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:32:25 +0200
Subject: [Buildroot] [PATCH RESEND 0/2] Use bzip2 for X11 PFC font
 compression
In-Reply-To: <20200713184751.23534-1-asierra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
Message-ID: <20200713213225.7e9d3343@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aaron,

Thanks for this work!

On Mon, 13 Jul 2020 13:47:49 -0500
Aaron Sierra <asierra@xes-inc.com> wrote:

> Gzip has been used as the default compressor for PCF fonts, but this
> series changes the default compressor to bzip2 for a few reasons:
> 
> 1. Even with the latest gzip, these seemingly synonymous pipelines
>    produce different output, but this issue does not exist with bzip2:
> 
>   $ cat /path/to/file | gzip > /path/to/file.gz
>   $ gzip < /path/to/file > /path/to/file.gz
> 
> 2. Prior to gzip 1.10, the compression pipeline used with PCF fonts was
>    not reproducible due to the implicit -N/--name injecting a timestamp:
> 
>   * cat /path/to/file | gzip > /path/to/file.gz
> 
> 3. The BR2_USE_WCHAR dependency of the gzip package tarnishes the appeal
>    of using host-gzip to provide reproducible output.

This argument seems pretty weird. The fact that gzip needs
BR2_USE_WCHAR on the target doesn't at all prevent from building
host-gzip. We have plenty of host packages that need wchar packages,
and we simply assume the host system as wide char support available.

So this third argument is a bit "moot", especially since
host-xapp-mkfontscale already has a dependency on host-gzip, which
builds a gzip 1.10, so it shouldn't be affected by the problem you
describe.

So that leaves us with just argument (1), correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
