From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 1 Feb 2011 22:36:50 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: fix upper case
	$(PKG)_SITE_METHOD
In-Reply-To: <AANLkTi=-RcJORsWa+Zm29xcMhEX2STMJYOyXRTN7Qjpa@mail.gmail.com>
References: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
	<20110201213433.1d527342@surf>
	<AANLkTi=-RcJORsWa+Zm29xcMhEX2STMJYOyXRTN7Qjpa@mail.gmail.com>
Message-ID: <AANLkTi=hsz2+gsaUihXuYAz8uRuVKa4f0A9q3wHSdJgq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/1 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> On 1 February 2011 21:34, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Tue, ?1 Feb 2011 12:18:49 +0100
>> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>>
>>> ? ? ? ? ? ? ? case "$($(PKG)_SITE_METHOD)" in \
>>> - ? ? ? ? ? ? ? ? ? ? git) $($(DL_MODE)_GIT) && exit ;; \
>>> - ? ? ? ? ? ? ? ? ? ? svn) $($(DL_MODE)_SVN) && exit ;; \
>>> - ? ? ? ? ? ? ? ? ? ? bzr) $($(DL_MODE)_BZR) && exit ;; \
>>> + ? ? ? ? ? ? ? ? ? ? GIT) $($(DL_MODE)_GIT) && exit ;; \
>>> + ? ? ? ? ? ? ? ? ? ? SVN) $($(DL_MODE)_SVN) && exit ;; \
>>> + ? ? ? ? ? ? ? ? ? ? BZR) $($(DL_MODE)_BZR) && exit ;; \
>>> ? ? ? ? ? ? ? ? ? ? ? *) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>>> ? ? ? ? ? ? ? esac ; \
>>> ? ? ? fi ; \
>>
>> No. This is going to break:
>>
>> ? ? ? ?# Try automatic detection using the scheme part of the URI
>> ? ? ? ?$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
>>
>> is used to detect the site method from the URI, like :
>>
>> ? ? ? ?git://....
>>
>> or
>>
>> ? ? ? ?svn://....
>>
>> so if only upper case site methods are accepted, it's not going to work.
>
> Oh, didn't see that one.
>
>> And more generally, I'd prefer to keep the existing lower-case writing
>> of the site method, since it is coherent with how it's written in the
>> URI.
>
> How about my first patch then, allowing both upper and lower case (to
> stay in sync with doc)? Or reword the doc?
>
> Having doc != implementation is confusing so one of them should get patched :-)

Hm, I see other places where lower case names are used:

ifeq ($$($(2)_SITE_METHOD),svn)
DL_TOOLS_DEPENDENCIES += svn
else ifeq ($$($(2)_SITE_METHOD),git)
DL_TOOLS_DEPENDENCIES += git
else ifeq ($$($(2)_SITE_METHOD),bzr)
DL_TOOLS_DEPENDENCIES += bzr
endif # SITE_METHOD

So the best thing is probably to patch the documentation.
