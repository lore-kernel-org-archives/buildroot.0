From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 8 Jun 2018 09:48:26 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer> <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
Message-ID: <5675dcb9-67cc-d09e-6c5b-de0522996a20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-06-18 01:12, Carlos Santos wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "Yann Morin" <yann.morin.1998@free.fr>, "DATACOM" <casantos@datacom.com.br>
>> Cc: "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "buildroot" <buildroot@buildroot.org>
>> Sent: Thursday, June 7, 2018 6:03:48 PM
>> Subject: Re: [Buildroot] [PATCH] fs: allow extra arguments to common tarball extraction
> 
>> On 06-06-18 20:51, Yann E. MORIN wrote:
>>> But my position has always been consistent on this topic: the images
>>> that Buildroot generates only ever covers just "basic" situations, using
>>> a single-filesystem layout. Anything that needs to do a multi-filesystem
>>> layout should be done as a new filesystem. Doing it in a new filesystem
>>> is much more flexible than whatever kconfig option we may ever add. And
>>> since we already have this wonderful flexibility, I don't think it makes
>>> sense to add a new option that duplicates only a very limited subset of
>>> that flexibility. That duplication is not good, IMNSHO...
>>
>> There is (in my even less humble opinion) one way that we can solve this
>> generically: by adding a genimage filesystem. genimage is able to create
>> separate filesystem images for subtrees. so it can cover many use cases in a
>> generic way.
> 
> I'm already working on a patch to convert inner-rootfs into a generic
> inner-filesystem macro. I will submit it for comments soon.
> 
> BTW, it took me some time to understand the dual personality of TARGET_DIR
> in fs/common.mk and the role of BASE_TARGET_DIR. Then I found the line in
> the top Makefile with
> 
>   TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> 
> I understand that this trick avoids changing fs/*/*.mk replacing each
> reference to TARGET_DIR by a ROOTFS_<FOO>_TARGET_DIR but it reduces
> the readability a lot. I'm compelled to restore it to how it was prior
> to commit 7e9870ce32d.

 The same (or a similar) trick will be applied to the normal packages for
per-package host/staging/target (which is ultimately needed for top-level
parallel build). If we want to avoid it there, we would have to change 785
package.mk files, and also many package definitions in BR2_EXTERNALs that we
don't control...

 That said, I would also prefer to use explicit $(FOO)_TARGET_DIR variables. But
doing so *will* require legacy handling.

 Maybe we should indeed use explicit ROOTFS_$(ROOTFS)_TARGET_DIR in our rootfs
definitions, document that that is the one to use, and wait a year or two before
deprecating TARGET_DIR entirely.

 Yann?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
