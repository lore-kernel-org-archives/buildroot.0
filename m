From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 21:33:23 +0100
Subject: [Buildroot] [PATCH 0/4 v4] pkg-download: check hashes before
 the download (branch yem/download-hash)
In-Reply-To: <cover.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <20141211213323.54d3d1df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 19:24:40 +0100, Yann E. MORIN wrote:

> This series introduces a way to check hashes prior to doing a download.
> 
> This is required for when upstream silently update their release tarballs
> without renaming them, and the user is left with a stray locally cached
> tarball that no longer match the hashes with have for that package.
> 
> In so doing, this series:
>   - moves the check for a cached file into the wrapper;
>   - moves the post-download check for hashes into the wrapper;
>   - adds a pre-download check for hashes in the wrapper.
> 
> Doing the pre-download checks in the Makefile, like the post-download
> checks were done, made the Makefile a bit harder to read. On the other
> hand, we have a download wrapper shell script, so it is easier to do
> trickey stuff in there (shell syntax) than in the Makefile (make syntax
> can become unreadable pretty fast).
> 
> This has a side effect of cleaning up the pkg-download.mk Makefile, too,
> but that was not the goal.

I did a quick test, and things seems to work as expected. There is
however one corner case that gives a fairly funky behavior: when the
tarball is corrupt in $(DL_DIR) *and* when the hash doesn't match the
file that is downloaded. To test this, I poisoned the busybox tarball
in my $(DL_DIR), and also modified busybox.hash to have a hash that
doesn't match (note that I changed only the SHA1 hash, not the MD5
one). And in this case, what happens is that:

 1. Aaah, the hash is not good, let's re-download.
 2. Download happens
 3. Aaah, the hash is still not good, let's re-download
 4. Download happens
 5. Aaaah, the hash is still not good. Let's give up now.

Clearly, downloading the tarball twice is not necessary here.

Here is the log of this test:

ERROR: busybox-1.22.1.tar.bz2 has wrong md5 hash:
ERROR: expected: 337d1a15ab1cb1d4ed423168b1eb7d7e
ERROR: got     : 5ee6a6f8269d5b391a990306f664dd4c
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
Re-downloading 'busybox-1.22.1.tar.bz2'...
--2014-12-11 20:35:17--  http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2
R?solution de www.busybox.net (www.busybox.net)? 140.211.167.224
Connexion ? www.busybox.net (www.busybox.net)|140.211.167.224|:80? connect?.
requ?te HTTP transmise, en attente de la r?ponse? 200 OK
Taille?: 2218650 (2,1M) [application/x-bzip2]
Enregistre : ?/home/thomas/projets/buildroot/output/build/.busybox-1.22.1.tar.bz2.NOqWFC/output?

100%[=======================================================================================================================================================================>] 2 218 650    475KB/s   ds 5,8s   

2014-12-11 20:35:23 (372 KB/s) - ?/home/thomas/projets/buildroot/output/build/.busybox-1.22.1.tar.bz2.NOqWFC/output? enregistr? [2218650/2218650]

busybox-1.22.1.tar.bz2: OK (md5: 337d1a15ab1cb1d4ed423168b1eb7d7e)
ERROR: busybox-1.22.1.tar.bz2 has wrong sha1 hash:
ERROR: expected: e6e96fefb6f0fb8079f27468b9bf22d8dd96108e
ERROR: got     : d6e96fefb6f0fb8079f27468b9bf22d8dd96108e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2014-12-11 20:35:23--  http://sources.buildroot.net/busybox-1.22.1.tar.bz2
R?solution de sources.buildroot.net (sources.buildroot.net)? 176.9.16.109
Connexion ? sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80? connect?.
requ?te HTTP transmise, en attente de la r?ponse? 200 OK
Taille?: 2218650 (2,1M) [application/x-bzip2]
Enregistre : ?/home/thomas/projets/buildroot/output/build/.busybox-1.22.1.tar.bz2.MIVtVV/output?

100%[=======================================================================================================================================================================>] 2 218 650    386KB/s   ds 4,0s   

2014-12-11 20:35:27 (543 KB/s) - ?/home/thomas/projets/buildroot/output/build/.busybox-1.22.1.tar.bz2.MIVtVV/output? enregistr? [2218650/2218650]

busybox-1.22.1.tar.bz2: OK (md5: 337d1a15ab1cb1d4ed423168b1eb7d7e)
ERROR: busybox-1.22.1.tar.bz2 has wrong sha1 hash:
ERROR: expected: e6e96fefb6f0fb8079f27468b9bf22d8dd96108e
ERROR: got     : d6e96fefb6f0fb8079f27468b9bf22d8dd96108e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
package/pkg-generic.mk:73: recipe for target '/home/thomas/projets/buildroot/output/build/busybox-1.22.1/.stamp_downloaded' failed
make: *** [/home/thomas/projets/buildroot/output/build/busybox-1.22.1/.stamp_downloaded] Error 1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
