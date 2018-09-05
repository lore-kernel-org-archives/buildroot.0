From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:34:35 +0200
Subject: [Buildroot] [PATCH v1 4/4] qt5virtualkeyboard: add hashes of
 3rd-party licenses
In-Reply-To: <20180903123747.5234-5-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-5-gael.portay@savoirfairelinux.com>
Message-ID: <20180905233435.2e2d72c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc.

On Mon,  3 Sep 2018 08:37:47 -0400, Ga?l PORTAY wrote:
> Add missing license hashes for those three third-parties:
> 
> 	- src/virtualkeyboard/3rdparty/openwnn/NOTICE
> 	- src/virtualkeyboard/3rdparty/pinyin/NOTICE
> 	- src/virtualkeyboard/3rdparty/tcime/COPYING
> 
> Fixes:
> 
> 	>>> qt5virtualkeyboard 5.11.1 Collecting legal info  
> 	LICENSE.GPL3: OK (sha256: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)
> 	ERROR: No hash found for src/virtualkeyboard/3rdparty/openwnn/NOTICE
> 	ERROR: No hash found for src/virtualkeyboard/3rdparty/pinyin/NOTICE
> 	ERROR: No hash found for src/virtualkeyboard/3rdparty/tcime/COPYING
> 	src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt: OK (sha256: 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10)
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

So, I've applied, but...

> ---
>  package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash | 5 +++++
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash     | 3 +++

I'm not happy with how we handle per-version hash files. What you did
is identical to what we do in qt5base, and you don't have much choice
right now, but it's not great.

The download infrastructure only checks the main hash file, i.e
package/<pkg>/<pkg>.hash, so we have to list in this file the hashes
for all files that are downloaded, regardless of their version.

However, the legal-info stuff looks first in
package/<pkg>/<version>/<pkg>.hash, and only if it doesn't exist, it
looks in package/<pkg>/<pkg>.hash. This means that we can store
per-version hashes for license files in
package/<pkg>/<version>/<pkg>.hash. This is needed because a file named
COPYING may exist in two different versions of a given package, but
with different contents, and therefore different hashes.

I think this is not very consistent today. I see two possible options:

 (1) Make the download stuff consistent with the legal-info stuff so
     that we can move the hashes for the downloaded stuff to the
     per-version folders.

 (2) Keep things as they are today in terms of infra, but move the
     hashes for license files in qt5base and qt5virtualkeyboard to
     per-version directories.

I am fine with (2), but I find the current situation where hashes for
some license files are in the main folder, and some hashes are in a
per-version folder is very confusing.

Yann ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
