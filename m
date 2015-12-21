From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 13:26:37 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <5676CDEE.10206@mind.be>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <566DDC20.5000104@mind.be> <20151220124957.GA3677@free.fr>
 <5676CDEE.10206@mind.be>
Message-ID: <20151221122636.GB3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-20 16:49 +0100, Arnout Vandecappelle spake thusly:
> On 20-12-15 13:49, Yann E. MORIN wrote:
> > On 2015-12-13 21:59 +0100, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >>  To fundamentally avoid this type of issue (we have a bunch of fixes like this),
> >> I think we should add an additional directory that is put in the _beginning_ of
> >> the path in TARGET_MAKE_ENV. This directory could then be populated through the
> >> _CONFIG_SCRIPTS mechanism.
> >>
> >>  What do the others think?
> > 
> > I'v estarted having a look at your suggestion. The basic idea is
> > relatively trivial to do, and I now have a FOO_CONFIG_DIR location
> > where I put those scripts.
> > However, I'm not facing a wall:
>  I guess you _are_ facing a wall :-)

s/not/now/ :-)

> > So, we'd need to split the PATH for host and target variants.
> > I wonder if that would be acceptable.
>  They used to be, but since they were identical, Samuel factored them away in
> b989976.

Ah, thianks for the sha1, I was looking for it earlier.

[--SNIP--]
> > My grep-fuu must still be asleep today, since I could only identify wine
> > in the second category, although I'm pretty sure we have at least a few
> > other packages that we do patch for that.
> git grep \\-config -- \*.patch
>  Lot's of false positives though.

I can start with that.

> > The packages in the first category are reltively rare: only about 50 of
> > them I could identify, so it should be pretty easy to fix.
> 
>  I was more concerned with the fixes like the one that was added by this patch:
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 534131b..2b06699 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -24,6 +24,7 @@ WIRESHARK_CONF_OPTS = \
>  	--enable-static=no \
>  	--with-libsmi=no \
>  	--with-lua=no \
> +	--with-pcap=$(STAGING_DIR)/usr \
>  	--includedir=$(STAGING_DIR)/usr/include
> 
>  Another grep which turns up lots of false positives:
> git grep '\--with-.*=\$(STAGING_DIR)'

Yep, we can hunt them one by one as time passes...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
