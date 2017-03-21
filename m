From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Mar 2017 00:57:39 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <20170320225250.0a5bd659@free-electrons.com>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
 <20170320225250.0a5bd659@free-electrons.com>
Message-ID: <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-17 22:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 20 Dec 2016 14:46:28 +0100, J?r?me Pouiller wrote:
> 
>> libtool include support for cross-compilation since v1.5.
> 
> Are you sure this is true?
> 
> In the release notes of libtool v2.4
> (https://savannah.gnu.org/forum/forum.php?forum_id=6525), I see:
> 
> """
> 
> 
> New in 2.4 2010-09-22:
> 
>     New features:
> 
> - Sysroot support. This allows you to build cross-compiled packages
> with the same prefix that will be used on the destination machine,
> and still find dependent libraries under the compiler's "sysroot".
> Without sysroot support, paths internal to the build system may leak
> into the product of the build.
> 
> Sysroot support is disabled unless the --with-sysroot configure
> option is passed to configure, because .la files generated with
> sysroot support will not be usable in general with older Libtools. 
> 
> """
> 
> So are you sure that this feature didn't appear in libtool 2.4 ?

 Yeah, looks like it. E.g. speex has libtool 1.5, and it doesn't have any
sysroot support (not in configure, not in ltmain.sh).

 Obviously, *this* patch is not affected by it - it certainly doesn't hurt to
pass the --with-sysroot configure option. It's only patches 12+13 that we
wouldn't be able to remove.

 However, considering:

- most packages install things in /usr/lib, which is already searched by default;

- most packages use libtool 2.4 or later,

I think we can take the risk. The autobuilders will discover any issues, which
we can fix per package (e.g. with AUTORECONF = YES).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
