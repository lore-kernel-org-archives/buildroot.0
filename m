From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 10:39:15 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <87y3b5ks97.fsf@tkos.co.il>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
Message-ID: <20181011103915.69e80d88@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 07:43:32 +0300, Baruch Siach wrote:

> The build only fails with the CT-NG PowerPC e500 toolchain. Is that the
> only gcc 4.7 toolchain?
> 
> This is the failing code:
> 
> typedef double hbase_f(double);
> 
> class StatHist
> {
>     ...
>     hbase_f *val_in = nullptr;        /* e.g., log() for log-based histogram */
>     hbase_f *val_out = nullptr;       /* e.g., exp() for log based histogram */
> }
> 
> For some reason this version of gcc considers val_in/val_out as
> methods.

They are function pointers, since hbase_f is a typedef of a function
that takes a double as argument and returns a double.

Indeed, the following minimal program:

typedef double hbase_f(double);

class StatHist
{
	hbase_f *val_in = nullptr;
};

fails to build with gcc 4.7, but builds fine with a more recent gcc. It
would be good to find another gcc 4.7 toolchain to see if the same
problem occurs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
