From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 2 Dec 2017 03:12:33 +0200
Subject: [Buildroot] Putting qtwebkit on a diet
In-Reply-To: <20171201160630.392cc220@windsurf.lan>
References: <7f8d2d60-b870-61f1-df5e-ed83f9923c39@petroprogram.com>
 <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
 <20171130090230.79cedfe7@windsurf.home>
 <f7391a80-8158-7b15-b1ef-d6386982f426@petroprogram.com>
 <20171201151034.44c460b3@windsurf.lan>
 <7264cc95-a3cd-a416-de49-cf06fe865ef1@petroprogram.com>
 <20171201160630.392cc220@windsurf.lan>
Message-ID: <e090a7f1-349b-0a44-469d-6b22b97d8820@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I tried with just thumb and -Os options (did not give either
"optimize_size" or "minimal" this time for QtWebkit)
and I got it down to 12 MB.

I also think that "optimize_size" and "minimal" options for QtWebkit are
the same.
At least did not see any change in 7.6 MB size no matter what
combination of those switches used.

So to sum it all:

- Doing thumb/-Os build without doing anything extra (like HTML5 video
supports that needs gst-plugins-base 1.0)
? and just the bare minimum dependencies for QtWebkit gives around 12 MB
for raspberry pi 3 target

- Using either optimize_size/minimal for QtWebkit (qmake
WEBKIT_CONFIG="minimal" or qmake WEBKIT_CONFIG="optimize_size")
? with thumb & -Os gives 7.6 MB both and they *seem* to be equivalent
(at least they seem to disable same features both from core of QtWebkit)

So I think it will be just 2 patches then ...
patch #1: introduce? optimize_size/minimal build option
patch #2: expose all the features that can be individually enabled/disabled

Before submitting patches, I will still try the minimal build and test
the provided minibrowser and see what works and what not
so that I know if it makes sense to have patch #1.

-S-

Thomas Petazzoni kirjoitti 01.12.2017 klo 17:06:
> Hello,
>
> On Fri, 1 Dec 2017 16:51:37 +0200, Stefan Fr?berg wrote:
>
>> I guess on non-ARM the optimize for size feature is doing just? -Os but
>> on ARM it also needs thumb enabled.
>> Otherwise it nags "Not supported ARM architecture" (this while building
>> for raspberry pi3)
> Then we don't want additional options for this, because we already have
> top-level options to select Thumb2 and -Os.
>
> Best regards,
>
> Thomas
