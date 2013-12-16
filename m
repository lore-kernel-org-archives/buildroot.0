From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Mon, 16 Dec 2013 10:33:10 -0600
Subject: [Buildroot] [PATCH 1/1] smcroute: new package
In-Reply-To: <CAAXf6LU8=fxMQKZQZfAOW-jX3b_466XnToBxFANkck6dNyx-Vw@mail.gmail.com>
References: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>	<3a2395ee-73bc-4723-a368-61194e9c0a08@email.android.com>
 <OF808C467A.175074BD-ON86257C43.004D34F3-86257C43.004D9D54@rockwellcollins.com>
 <CAAXf6LU8=fxMQKZQZfAOW-jX3b_466XnToBxFANkck6dNyx-Vw@mail.gmail.com>
Message-ID: <OFDFF4011F.539E6A02-ON86257C43.0059E8A8-86257C43.005AED4B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/16/2013 
09:25:41 AM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: mlweber1 at rockwellcollins.com
> Cc: buildroot <buildroot@busybox.net>, Sean Gerhardt 
> <sagerhar@rockwellcollins.com>
> Date: 12/16/2013 09:25 AM
> Subject: Re: [Buildroot] [PATCH 1/1] smcroute: new package
> 
> Hi Matt,
> 
> On Mon, Dec 16, 2013 at 3:07 PM,  <mlweber1@rockwellcollins.com> wrote:
> 
> >> >+SMCROUTE_SITE = $(call 
github,troglobit,smcroute,$(SMCROUTE_VERSION))
> >> >+SMCROUTE_SOURCE =
> > troglobit-smcroute-$(SMCROUTE_VERSION)-0-g58388f6.tar.gz
> >>
> >> Why is it needed to specify _SOURCE here? It shouldn't be ..
> > It seems like the releases are labeled in a way that requires this.
> > Without
> > specifying the source archive name, the archive that's requested to be
> > downloaded
> > "smcroute-$(SMCROUTE_VERSION).tar.gz" ends up as the file we noted as 
the
> > SOURCE.
> 
> I'm not sure I understand what you mean.
> When I remove the _SOURCE line, I can still download and extract the
> package normally. The name of the tar file is indeed different, but
> this does not matter. The package infrastructure still correctly
> handles it.
> 
> If you still think this _SOURCE is needed, could you explain in more 
detail?

I think I figured out what's happening.  (Our office firewall makes this 
almost impossible to test, so I'll have to confirm tonight)
If I remove the SOURCE archive definition from the .mk, the package 
downloads and I think the buildroot pkg scripts then use the 
resulting filename of the archive to extract it, which results in the 
correct smcroute folder under build.  I think the issue with not defining 
the 
SOURCE filename comes into play if a buildroot dl cached local archive 
file is 
used to build the package.  Buildroot then can't find the source archive 
because the cached archive file has a unique filename.  This results in 
the buildroot pkg scripts proceeding to re-download the source archive 
again before continuing with extracting the unique filename and doing 
proceeding with the rest of the pkg build.

We noticed this because our builds primarily using a cached/mirrored dl
folder of archive files.

Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131216/087c0889/attachment-0001.html>
