From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 17:01:45 +0200
Subject: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an
 available Rust libc
In-Reply-To: <SJ0PR18MB3898F64AF1A5908759597DBE952B9@SJ0PR18MB3898.namprd18.prod.outlook.com>
References: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>
 <20210518230043.63dc9ac7@windsurf.orange-hotspot>
 <SJ0PR18MB3898F64AF1A5908759597DBE952B9@SJ0PR18MB3898.namprd18.prod.outlook.com>
Message-ID: <20210519150145.GZ2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, All,

On 2021-05-19 12:35 +0000, Nathaniel Husted spake thusly:
> Apologies for missing the robust engineering solution there.

It's not a problem! ;-) In fact, often it is only when actually
reviewing and hacking on a patch, that a better solution appears.
And then, it gets faster to just write the patch and send it for
review, than explain it in human-words.

> As a follow-up question, how does the buildroot community generally
> handle .hash file updates?

This is a manual step. What I do when I bump a version, is I modify it
in the hash file but leave the old hash as-is, then I do the download,
and the hash obviously does not match, but the new one is dsplayed, so
I update the hash file with it, and verify it by redownloading.

> Should these always be done in a package patch set via multiple parts?

The update of the hash file must be done in the same patch that updates
the version.

> Do you test the gpg keys and sha256sums "by hand" or is there a
> utility used when version update commits occur?

There is no tooling in the Buildroot tree, no. Verifying signatures is
done manually. In this case, I think Thomas, after downloading all the
archives and their .asc, basically did:
    for i in *.asc; do gpg --verify ${i}; done

But this case is exceptional; usually, there is only one file for which
to check the hash and signature, not 16! :-)

Also, I do not usually verify many signatures, since I have almost zero
connection in the WoT, so verifying a sig does not bring much benefit.
But if my download got compromised (maliciously or accidentally), the
hash I added will be wrong for someone else, especially the autobuilders,
and we can act on the issue.

Of course, this does not work if the remote server was compromised, but
in that case, checking the signatures without a good trust-chain in the
WoT is useless too...

> I was looking through the contributor documentation to determine
> expectations with respect to patches and looked through the utilities
> folder to see if there were supporting tools but could not find a
> discussion.

No, there is no tooling, and there is only the manual about hash files:
    https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Thanks for your contribution! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
