From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 08:10:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-22
In-Reply-To: <20140523190819.45a80027@free-electrons.com>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
Message-ID: <53857DE2.6040509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/14 19:08, Thomas Petazzoni wrote:
> Dear Fabio Porcedda,
> 
> On Fri, 23 May 2014 11:32:28 +0200, Fabio Porcedda wrote:
> 
>>>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/520606ec674f6c8efad6ebbb840099ec89d03130/
>>>     x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc21623fbc3d4e94f09b2cb0be36ce05cf75a2e6/
>>
>> It's related to BR2_PREFER_STATIC_LIB=y, I'm trying to fix it.
> 
> Please note that Gustavo has already done a lot of investigation on
> this one. It boils done to the fact that we pass --static instead of
> -static when building statically. But we switched from -static to
> --static a while ago, for some reason that the commit doesn't make
> really clear.

 I remember that: libtool will parse the -static option and act accordingly.
Only, it interprets it differently than gcc: it will only link statically
against local libraries, not against installed libraries. If we don't have any
.so files in $(STAGING_DIR), that wouldn't be a problem because it would still
link statically (no other option). But unfortunately there are still quite a few
packages that do install .so files in $(STAGING_DIR) - e.g. toolchain-external.
So without the --static, you end up with a lot of dynamically linked programs.

 For reference, the commit is 0a4bd19f4.

 As that commit mentions, we would actually like to pass -all-static to libtool.
But of course, that option is not known by gcc, so it won't work if libtool is
not used...

 A proper solution would be to adapt our libtool patches to interpret -static as
-all-static. Or alternatively, to patch the compiler wrapper to interpret
-all-static as -static (and then of course we'd have to generalize the compiler
wrapper to also use it for internal toolchains).

 If someone writes a patch, put me in Cc and I'll test it on a static
allpackageyesconfig.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
