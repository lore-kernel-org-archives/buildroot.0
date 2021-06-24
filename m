From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 18:18:40 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210624160922.5c3ba9dd@fedora>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-2-herve.codina@bootlin.com>
 <20210621213140.GA44262@scaer>
 <20210622094052.01c0a074@bootlin.com>
 <20210622113003.7cbf0136@windsurf>
 <e866365b-6244-303a-62d7-1cb00fda8897@green-communications.fr>
 <20210622102433.GF44262@scaer> <20210624160922.5c3ba9dd@fedora>
Message-ID: <20210624161840.GA1126048@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-24 16:09 +0200, Herve Codina spake thusly:
> On Tue, 22 Jun 2021 12:24:33 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> Well, according to the different exchanges,
> 
> I think I can remove LC_ALL (we don't care about any order), and I keep
> '... | xargs -0 -r md5sum'.
> 'cd' is not needed (we do not care about absolute or relative path).
> 
> So, the snapshot is taken using:
> find -L $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;

I spoke about -L as a suggestion to follow and monitor symlinks.
However, as I said, that does not work, at least for host/, because it
will emit a warning about a directory loop. Also, there is no telling
what users will install i their target/ and we may have a similar
situation for target/.

This warning is not nice as it will happen for each and every packages.

So, drop -L. At the very least, we have the infrastructure in place, and
we can extend it later should we need additional details.

But now that I think about it, the entry-changed-to-omething-else case
is already covered by the existing instrumenttion, as part of the
pkg_size_before/after hooks (find's %y printf directive)

So, yes, just drop the -L.

> and the detection is done using:
> md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5
> 
> Is that ok for everyone ?

Except for -L, yes, this is a proper summary from my point if view.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
