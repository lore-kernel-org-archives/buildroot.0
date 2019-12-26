From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 22:34:27 +0100
Subject: [Buildroot] [PATCH] package/at91bootstrap3: fix hash
In-Reply-To: <38659ae6-b7d6-3ddb-37d4-4c677f99ef99@koncepto.io>
References: <1577393383-29831-1-git-send-email-pjtexier@koncepto.io>
 <20191226215951.7e821c22@windsurf>
 <38659ae6-b7d6-3ddb-37d4-4c677f99ef99@koncepto.io>
Message-ID: <20191226223427.6fd04909@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann.

On Thu, 26 Dec 2019 22:16:50 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> No, I don't understand :/, this seems strange.
> I can see a difference on the size (441K vs 444K) for sure, but not 
> really differences on the files in the archive.
> 
> You can download the bogus archive here:
>   - https://jirafeau.net/f.php?h=1j8hLl-Y

Thanks. Diffoscope reports some useful information:

??? filetype from file(1)
? @@ -1 +1 @@
? -POSIX tar archive (GNU)
? +POSIX tar archive

And indeed, after uncompressing the archives:

$ file at91bootstrap3-v3.9.0.tar.bad at91bootstrap3-v3.9.0.tar.good
at91bootstrap3-v3.9.0.tar.bad:  POSIX tar archive (GNU)
at91bootstrap3-v3.9.0.tar.good: POSIX tar archive

So, what I think happened is that your at91bootstrap3-v3.9.0.tar.gz is
the result from using the Buildroot feature to fetch from a Git
repository and then creating a .tar.gz archive (we create them in GNU
format). Which is different from the .tar.gz created by Github.

And indeed, if I configure the at91bootstrap3 package like this:

BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"

The tarball I get has the original hash you provided:

at91bootstrap3-v3.9.0.tar.gz: OK (sha256: 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e)

So basically, there is a naming conflict between the name of the
tarball that we retrieve directly from Github, and the name of the
tarball we produce locally by cloning the Git repository + creating the
tarball.

I'll apply your patch to fix the immediate issue, but I guess we have a
larger issue here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
