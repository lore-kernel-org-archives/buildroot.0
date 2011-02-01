From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 1 Feb 2011 22:30:18 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: fix upper case
	$(PKG)_SITE_METHOD
In-Reply-To: <20110201213433.1d527342@surf>
References: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
	<20110201213433.1d527342@surf>
Message-ID: <AANLkTi=-RcJORsWa+Zm29xcMhEX2STMJYOyXRTN7Qjpa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 February 2011 21:34, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, ?1 Feb 2011 12:18:49 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> ? ? ? ? ? ? ? case "$($(PKG)_SITE_METHOD)" in \
>> - ? ? ? ? ? ? ? ? ? ? git) $($(DL_MODE)_GIT) && exit ;; \
>> - ? ? ? ? ? ? ? ? ? ? svn) $($(DL_MODE)_SVN) && exit ;; \
>> - ? ? ? ? ? ? ? ? ? ? bzr) $($(DL_MODE)_BZR) && exit ;; \
>> + ? ? ? ? ? ? ? ? ? ? GIT) $($(DL_MODE)_GIT) && exit ;; \
>> + ? ? ? ? ? ? ? ? ? ? SVN) $($(DL_MODE)_SVN) && exit ;; \
>> + ? ? ? ? ? ? ? ? ? ? BZR) $($(DL_MODE)_BZR) && exit ;; \
>> ? ? ? ? ? ? ? ? ? ? ? *) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>> ? ? ? ? ? ? ? esac ; \
>> ? ? ? fi ; \
>
> No. This is going to break:
>
> ? ? ? ?# Try automatic detection using the scheme part of the URI
> ? ? ? ?$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
>
> is used to detect the site method from the URI, like :
>
> ? ? ? ?git://....
>
> or
>
> ? ? ? ?svn://....
>
> so if only upper case site methods are accepted, it's not going to work.

Oh, didn't see that one.

> And more generally, I'd prefer to keep the existing lower-case writing
> of the site method, since it is coherent with how it's written in the
> URI.

How about my first patch then, allowing both upper and lower case (to
stay in sync with doc)? Or reword the doc?

Having doc != implementation is confusing so one of them should get patched :-)
