From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 11:07:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-06-23
In-Reply-To: <20170624223852.7812d38d@windsurf.home>
References: <20170624063043.4336020982@mail.free-electrons.com>
 <20170624195411.37qp6b5ocvenrjeo@tarshish>
 <20170624223852.7812d38d@windsurf.home>
Message-ID: <20170625090751.GB3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-06-24 22:38 +0200, Thomas Petazzoni spake thusly:
> On Sat, 24 Jun 2017 22:54:11 +0300, Baruch Siach wrote:
> > On Sat, Jun 24, 2017 at 08:30:43AM +0200, Thomas Petazzoni wrote:
> > >      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/937c2c1e025bb16ca6fc26bc025ca728ad92bd3b |     
> > >       x86_64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/d397964e0a9b97fcc887143cdeaa02137e92469a |     
> > >       xtensa |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/dccea3d71f2433f45eca4403343a15d01dda5be7 |     
> > >      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/af9accf066801b61bc05f0deef0ea6cdf36dabed |     
> > >         m68k |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/a114fef820ed6e25603ded8594e6930f952cdfa2 |     
> > >      powerpc |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/e25e8b031a944320c6ab5260220910b03820bfda |     
> > >        nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/ee77acba11239511009bd98255599c9ecc043f6c |     
> > >       mipsel |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/059e916b409e8aac42f565c9eba29bd8fad9cadf |       
> > 
> > >>> openvpn 2.4.3 Downloading  
> > converted 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz' (ANSI_X3.4-1968) -> 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz' (UTF-8)
> > --2017-06-23 22:00:10--  http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz
> > 
> > [...]
> > 
> > 2017-06-23 22:00:10 (7.26 MB/s) - '/home/buildroot/build/instance-0/output/build/.openvpn-2.4.3.tar.xz.AZpKge/output' saved [929028/929028]
> > 
> > ERROR: openvpn-2.4.3.tar.xz has wrong sha256 hash:
> > ERROR: expected: 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb
> > ERROR: got     : 7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571
> > ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> > 
> > Not sure what is going on here. I have now tried again a fresh download, and 
> > also compared to the tarball I have in dl/. In both cases I get the expected 
> > hash. The tarball size here is 938440.
> > 
> > Maybe different downloaders get different tarballs?
> > 
> > What is the content of that tarball?
> > 
> > Does it match the signature[1]?
> 
> Indeed, weird. According to
> http://autobuild.buildroot.net/?reason=openvpn-2.4.3, this only happens
> on Yann and Richard autobuilder instances. Yann, Richard, could you
> manually try to download
> http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz,
> and see what its sha256 hash is?

OK, so I have two machien I've doen the test from. And indeed my
autobuilder has an issue:

(yem at autobuild)$ wget 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz'

(yem at autobuild)$ sha256sum openvpn-2.4.3.tar.xz
7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571  openvpn-2.4.3.tar.xz

(yem at autobuild)$ gpg --recv-key D72AF3448CC2B034
gpg: keyring `/home/ymorin/.gnupg/secring.gpg' created
gpg: requesting key 8CC2B034 from hkp server keys.gnupg.net
gpg: /home/ymorin/.gnupg/trustdb.gpg: trustdb created
gpg: key 2F2B01E7: public key "OpenVPN - Security Mailing List <security@openvpn.net>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)

(yem at autobuild)$ gpg --verify openvpn-2.4.3.tar.xz.asc
gpg: assuming signed data in `openvpn-2.4.3.tar.xz'
gpg: Signature made mer. 21 juin 2017 12:19:36 CEST using RSA key ID 8CC2B034
gpg: BAD signature from "OpenVPN - Security Mailing List <security@openvpn.net>"


However, when I do the same from my home machine, I get the expected
hash:

(yem at home)$ wget 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz'

(yem at home)$ sha256sum openvpn-2.4.3.tar.xz
15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb  openvpn-2.4.3.tar.xz


(yem at autobuild)$ gpg --recv-key D72AF3448CC2B034
gpg: keyring `/home/ymorin/.gnupg/secring.gpg' created
gpg: requesting key 8CC2B034 from hkp server keys.gnupg.net
gpg: /home/ymorin/.gnupg/trustdb.gpg: trustdb created
gpg: key 2F2B01E7: public key "OpenVPN - Security Mailing List <security@openvpn.net>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)

(yem at autobuild)$ gpg --verify openvpn-2.4.3.tar.xz.asc
gpg: assuming signed data in 'openvpn-2.4.3.tar.xz'
gpg: Signature made mer. 21 juin 2017 12:19:36 CEST
gpg:                using RSA key D72AF3448CC2B034
gpg: Good signature from "OpenVPN - Security Mailing List <security@openvpn.net>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F554 A368 7412 CFFE BDEF  E0A3 12F5 F7B4 2F2B 01E7
     Subkey fingerprint: B596 06E2 D8C6 E10B 80BE  2B31 D72A F344 8CC2 B034

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170625/ccc51d2f/attachment.asc>
