From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 00:53:17 +0200
Subject: [Buildroot] [PATCH 0/3] qt5webkit: fix build issue using system
 leveldb
In-Reply-To: <20180902202144.jmhaz6nz2gtk3n52@archlinux>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831231930.58f7ca3e@windsurf>
 <20180902202144.jmhaz6nz2gtk3n52@archlinux>
Message-ID: <92bebe0f-479a-a17d-219c-834fadf318f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/09/2018 22:21, Ga?l PORTAY wrote:
> Thomas,
> 
> On Fri, Aug 31, 2018 at 11:19:30PM +0200, Thomas Petazzoni wrote:
[snip]
>> I am a bit uneasy about this one, it seems to install "internal" stuff
>> of leveldb that are normally not meant to be installed. Do you/we
>> understand what this internal stuff, beyond just "it fixes qt5webkit" ?
>>
> 
> This static library consists of this *VERY SINGLE* symbol which is like
> an extra that is not shipped at installation.
> 
> Apparently WebKit see value in that function and has decided to use it
> [1].
> 
> As QtWebKit bundled the leveldb third-party to build WebKit, it rewrote
> the way how to build it (i.e. not using Makefile) in order to use qmake
> build system.
> 
> As that "Makefile" has been rewritten, QtWebKit has included this symbol
> directly to libleveldb.so to link against this library *ONLY* (which
> looks an error to me).
> 
> Later, QtWebKit has provided a configure option to use the libleveldb.so
> provided by the system (i.e. to disable the included third-party). This
> option links Qt5WebKit.so with both libleveldb.so and libmemenv.a
> libraries.
> 
> Is it more clear?
> 
> Note: Also, since leveldb has moved to cmake, this symbol is now a part
> of libleveldb.so and there is not more libmemenv.a [2] :/

 So, wouldn't a bump of leveldb which moves to cmake solve the issue entirely?


> 
>> (...) 
>>
>> All in all, I'm just worried by the installation of what looks like
>> some internal library/headers of leveldb. Could you comment on this ?
>>
> 
> We can consider memenv as an option of leveldb which installs the memenv
> development files (static library and header).

 Since it's only a static library and a header, it only gets installed to
staging, not target, so there is no reason to make it optional.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
