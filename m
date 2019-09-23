From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Mon, 23 Sep 2019 17:20:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <b5004549-c820-11d4-1b5f-a87cfbe084d2@mind.be>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
 <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
 <20190923092218.72ad7121@windsurf.home>
 <CAKpO6uHe017t7F34v8mjaCm-6GxpRJEuNX7uvzwSrEycrDd_5w@mail.gmail.com>
 <b5004549-c820-11d4-1b5f-a87cfbe084d2@mind.be>
Message-ID: <CAKpO6uEthhX7BcXH5a+WTsGTX2tAoNaRCMcgHRdn2xbWFS3AMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I did the patch to be consistent with the already existing libssh2
package, using choice. It's exactly the same use case.

1. at this point Buildroot doesn't allow to use mbedTLS backend even
though libssh supports it perfectly, this is _the root of the problem_

2. in case of *fully statically linked* ELF executables the size
difference between OpenSSL and mbedTLS is huge: it matters for embedded
targets with _very_ limited storage

3. for systems where it's impossible to use shared libraries this size
difference counts

An example:
a. ELF 1 -> libcurl -> libssh2 -> OpenSSL
b. ELF 2 -> libssh (NOT libssh2) -> mbedTLS

In case of a. OpenSSL is required for libssh2. Otherwise eliptic curve
KEX cannot be used [1] and we need them. For ECDSA/ED25519 with the
mbedTLS backend, the glue code is missing. The slow diffie hellman is
used instead.

On the otherside, ELF 2 from case b. is perfectly happy with mbedTLS and
ECDSA/ED25519 KEX, but currently this cannot be achieved.

Regards,

-- 
Mircea

[1] https://github.com/libssh2/libssh2/blob/master/RELEASE-NOTES#L5
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/1847245a/attachment.html>
