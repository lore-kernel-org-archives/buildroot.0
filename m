From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2016 00:52:58 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <20161117000239.36cd4e77@free-electrons.com>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
 <20161117000239.36cd4e77@free-electrons.com>
Message-ID: <671071c5-0fba-8834-3837-7f7ff5cf82fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 00:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 30 Oct 2016 17:02:13 +0100, Yann E. MORIN wrote:
[snip]
>> +# If the package does not have its own waf, use our own.
>> +ifeq ($$($(2)_BUNDLED_WAF),NO)
> 
> Where is the default value of this variable defined? It seems it's not
> defined anywhere, while it should be set to "YES".
> 
> However, what I dislike a bit is the slightly "negative" logic of this
> variable. By default, we assume packages have their bundled version of
> waf, so this variable is by default assumed to be set to "YES" (even
> though in fact it's empty).
> 
> Only packages that do *NOT* have a bundled version of waf can set
> <pkg>_BUNDLED_WAF = NO, to tell the infrastructure to add a dependency
> on host-waf.
> 
> To me it feels a bit weird to:
> 
>  1. Have a boolean that defaults to YES and that can be overridden to
>     NO. I generally expects the opposite.
> 
>  2. Have a boolean that when set to "NO" actually asks the
>     infrastructure to do more things. I generally expects the opposite.

 We have a bunch of these already: _INSTALL_TARGET, _LIBTOOL_PATCH,
_REDISTRIBUTE, .... Actually, most of them default to YES and are overridden as
NO. It's just that the most popular one (_INSTALL_STAGING) defaults to NO so
you'd think that that one is the norm.

 The only unusual thing here is that the condition checks for NO, while usually
the condition checks for YES. But turning it around we make it an ifneq which is
also a negative.

 So I'd keep it like this.


> So, ideally, I'd like to invert this variable, but I can't really find
> a good name for it.
> 
> I propose <pkg>_NEEDS_WAF on IRC, but I'm not convinced because all
> packages need waf, either bundled or external.
> <pkg>_NEEDS_EXTERNAL_WAF ?
> 
> Anyone has some other proposal ?
> 
>> +# Dependency on host-python is done by host-waf
>> +$(2)_DEPENDENCIES += host-waf
>> +$(2)_WAF = $(HOST_DIR)/usr/bin/waf
>> +else
>> +# We need host-python to run the package's waf
>> +$(2)_DEPENDENCIES += host-python
>> +$(2)_WAF = ./waf
>> +endif
> 
> Here another point where I'm hesitating. host-waf doesn't really need
> to build-depend on host-python. It's *running* host-waf that requires
> host-python. So I'm wondering if we shouldn't:
> 
>  1. Remove the host-python dependency from host-waf
> 
>  2. In the first case above (no bundled waf), add to the package a
>     dependency on host-waf *and* host-python.
> 
> On IRC, you suggested that packages that depend on host-waf should not
> have to know host-python is needed to run it, which is fair point.

 Well, it makes sense to me that a package infra does something like that, but
less so that the waf package itself would do it. And it's just simpler if the
dependency is only in the infra.

 However, I wonder if we need this dependency at all. We already require a
python (although admittedly we don't check the version). The few packages that
don't support python3 can add the dependency themselves. Building host-python
really eats into the build time...


 Regards,
 Arnout

> 
> So I'm opening the question to others.
> 
>> +ifndef $(2)_MAKE
>> + ifdef $(3)_MAKE
>> +  $(2)_MAKE = $$($(3)_MAKE)
>> + else
>> +  $(2)_MAKE ?= $$(MAKE)
>> + endif
>> +endif
> 
> Is $(2)_MAKE used anywhere in this infrastructure?
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
