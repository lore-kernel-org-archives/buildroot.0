From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Aug 2020 14:23:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.46
In-Reply-To: <20200807225632.41b7c8d0@gmx.net>
References: <20200807171100.220432-1-bernd.kuhls@t-online.de>
 <20200807192657.GJ2186@scaer> <20200807225632.41b7c8d0@gmx.net>
Message-ID: <20200808122312.GO2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-08-07 22:56 +0200, Peter Seiderer spake thusly:
> On Fri, 7 Aug 2020 21:26:57 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2020-08-07 19:11 +0200, Bernd Kuhls spake thusly:
> > > Changelog: http://archive.apache.org/dist/httpd/CHANGES_2.4.46
> > >
> > > Release notes: https://downloads.apache.org/httpd/Announcement2.4.html
> > >
> > > Fixes CVE-2020-9490, CVE-2020-11984 & CVE-2020-11993:
> > > https://httpd.apache.org/security/vulnerabilities_24.html
> > >
> > > Added all hashes provided by upstream.
> >
> > md5 and sha1 are broken nowadays, so adding them is not interesting at
> > all, when there are better hashes available, which is the case here.
> 
> If this handling is the new rule, then it is time to update the docs
> stating 'If upstream provides more than one type of hash (e.g. sha1 and sha512),
> then it is best to add all those hashes in the .hash file.'?

I wrote that more than 6 years ago now. ;-) Things have changed since
then.

The hashes are there to guarantee that the archives have not be tampered
with, so that we know that:

 1. there was no technical issue downloading the archive (e.g. partial
    download, proxy playing tricks, etc...),

 2. upstream did not re-release the same version with a different
    content, so that we know our patches would or would not apply for
    example,

 3. the source code has not been tampered with, so that no ill source
    code has been injected (either in-transit, or if upstream got
    compromised).

md5 is broken, there is no point in using it. If that's the only thing
upstream provides, we can carry it, but if upstream provides better
hashes, md5 brings nothing to address the above, especially point 3.

sha1 is not yet fully broken, but it is no longer trusted, and everyone
is moving away from it. If upstream only provides sha1, we can carry it,
but if upstream provides better hashes, then we should not _add_ sha1
(but we can continue to update an existing one we already carry). While
sha1 is still OK-ish to address accidental tampering (point 1) or
non-malicious modifications (point 2, and even then), it is now
useless to address malicious tampering (point 3).

This is the point of view hashes should be looked at from.

In this case, upstream provides two strong hashes, sha256 and sha512;
adding md5 is totally useless, while adding sha1 is borderline useless.

For the records:

  - md5 [0] was introduced 1991, and the first security issues were
    identified in 1993, and the first collisions reported in 1996.

  - sha1 [1] was introduced in 1995, is considered weak since 2005 (15
    years ago!), disallowed for signatures by NIST since 2013, and
    chosen-prefix attacks are a thing since this year.

[0] https://en.wikipedia.org/wiki/MD5
[1] https://en.wikipedia.org/wiki/SHA-1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
