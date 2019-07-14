From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 20:50:31 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
In-Reply-To: <20190714132329.GA25166@scaer>
References: <20190714124400.29431-1-arnout@mind.be>
 <20190714131502.GC8912@scaer> <20190714132329.GA25166@scaer>
Message-ID: <7841a190-820b-cd3c-4f71-2a5b0c5f6a0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/07/2019 15:23, Yann E. MORIN wrote:
> Arnout, Jerzy, All,
> 
> (sorry, I sent the previous one too quickly)
> 
> On 2019-07-14 15:15 +0200, Yann E. MORIN spake thusly:
>> On 2019-07-14 14:44 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> [--SNIP--]
>>> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899
>> No, it does not fix it totally. It only fixes the python traceback.
>> The Kodi issues is till present.
>> Hint: the Kodi package is the only one that indents the "source" lines
>> with a TAB.
> 
> If one changes Kodi to not indent the source lines, then the issue
> disappears. Of course, this is not the correct solution, but...

 Yes, because the test only looks at source lines which are indented, which is
wrong too. It should be a regex.

> 
> If one changes another package to also idnent the source lines with a
> TAB, then the error happens there too (for example, fftw):
> 
>     package/fftw/Config.in:18: Packages in: if BR2_PACKAGE_FFTW,
>                                are not alphabetically ordered;
>                                correct order: '-', '_', digits, capitals, lowercase;
>                                first incorrect package: ftw/fftw-d
> 
> OK, so, weird. The package included is in fact fftw/fftw-double and only
> part of the bname is reported.
> 
> But if one also looks more closely at the Kodi issue, packages names are
> also incorrectly reported:
> 
>     package/kodi/Config.in:303: Packages in: menu "Audio decoder addons",
>     [--SNIP--]
>                                 first incorrect package: kodi-audiodecoder
> 
> And in fact, there is one thing I don;t understand in utils/checkpackagelib/lib_config.py,
> line 106:
> 
>     new_package = text[17: -(len(self.filename)-5):]
> 
> Why are we using the current filename to strip away parts of the new
> package filename?

 That is indeed the problem. I didn't look too hard at that line (because I
already looked to much at all the rest :-). The len(self.filename)-5 works for
package/Config.in because that exactly strips off the /Config.in part of the
line. But that's a horrible hack, of course...

 I'll look at correcting it shortly.

 Regards,
 Arnout
