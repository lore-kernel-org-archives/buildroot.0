From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Sep 2019 17:19:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <CAKpO6uEthhX7BcXH5a+WTsGTX2tAoNaRCMcgHRdn2xbWFS3AMw@mail.gmail.com>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
 <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
 <20190923092218.72ad7121@windsurf.home>
 <CAKpO6uHe017t7F34v8mjaCm-6GxpRJEuNX7uvzwSrEycrDd_5w@mail.gmail.com>
 <b5004549-c820-11d4-1b5f-a87cfbe084d2@mind.be>
 <CAKpO6uEthhX7BcXH5a+WTsGTX2tAoNaRCMcgHRdn2xbWFS3AMw@mail.gmail.com>
Message-ID: <40bcf082-d4bd-6c01-37a9-6b5f50fa23f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/09/2019 16:20, Mircea Gliga wrote:
> Hello,
> 
> I did the patch to be consistent with the already existing libssh2
> package, using choice. It's exactly the same use case.

 Yeah, but I'm not sure if it's the best example. I think strongswan is a better
example, i.e. the choice selects the crypto provider package.

 I would also put openssl as the default, since that's what people are more
likely to want.


> 1. at this point Buildroot doesn't allow to use mbedTLS backend even
> though libssh supports it perfectly, this is _the root of the problem_
> 
> 2. in case of *fully statically linked* ELF executables the size
> difference between OpenSSL and mbedTLS is huge: it matters for embedded
> targets with _very_ limited storage

 Good point! That would be something nice to mention in the commit message.

 Refer to the commit message of 04a1031d3429ff8e5a2ae4d820702c50519243a8 for an
example of what we like to see.

 Regards,
 Arnout

> 
> 3. for systems where it's impossible to use shared libraries this size
> difference counts
> 
> An example:?
> a. ELF 1 -> libcurl -> libssh2 -> OpenSSL
> b. ELF 2 -> libssh (NOT libssh2) -> mbedTLS
> 
> In case of a. OpenSSL is required for libssh2. Otherwise eliptic curve
> KEX cannot be used [1] and we need them. For ECDSA/ED25519 with the
> mbedTLS backend, the glue code is missing. The slow diffie hellman is
> used instead.
> 
> On the otherside, ELF 2 from case b. is perfectly happy with mbedTLS and
> ECDSA/ED25519 KEX, but currently this cannot be achieved.
> 
> Regards,
> 
> --?
> Mircea
> 
> [1] https://github.com/libssh2/libssh2/blob/master/RELEASE-NOTES#L5
