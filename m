From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Dec 2019 17:15:04 +0100
Subject: [Buildroot] [PATCH] package/at91bootstrap3: fix hash
In-Reply-To: <20191226223427.6fd04909@windsurf>
References: <1577393383-29831-1-git-send-email-pjtexier@koncepto.io>
 <20191226215951.7e821c22@windsurf>
 <38659ae6-b7d6-3ddb-37d4-4c677f99ef99@koncepto.io>
 <20191226223427.6fd04909@windsurf>
Message-ID: <20191227161504.GR26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Pierre-Jean, All,

On 2019-12-26 22:34 +0100, Thomas Petazzoni spake thusly:
> On Thu, 26 Dec 2019 22:16:50 +0100
> Pierre-Jean Texier <pjtexier@koncepto.io> wrote:
> > No, I don't understand :/, this seems strange.
> > I can see a difference on the size (441K vs 444K) for sure, but not 
> > really differences on the files in the archive.
> > 
> > You can download the bogus archive here:
> >   - https://jirafeau.net/f.php?h=1j8hLl-Y
> 
> Thanks. Diffoscope reports some useful information:
> 
> ??? filetype from file(1)
> ? @@ -1 +1 @@
> ? -POSIX tar archive (GNU)
> ? +POSIX tar archive
> 
> And indeed, after uncompressing the archives:
> 
> $ file at91bootstrap3-v3.9.0.tar.bad at91bootstrap3-v3.9.0.tar.good
> at91bootstrap3-v3.9.0.tar.bad:  POSIX tar archive (GNU)
> at91bootstrap3-v3.9.0.tar.good: POSIX tar archive
> 
> So, what I think happened is that your at91bootstrap3-v3.9.0.tar.gz is
> the result from using the Buildroot feature to fetch from a Git
> repository and then creating a .tar.gz archive (we create them in GNU
> format). Which is different from the .tar.gz created by Github.
> 
> And indeed, if I configure the at91bootstrap3 package like this:
> 
> BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
> 
> The tarball I get has the original hash you provided:
> 
> at91bootstrap3-v3.9.0.tar.gz: OK (sha256: 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e)
> 
> So basically, there is a naming conflict between the name of the
> tarball that we retrieve directly from Github, and the name of the
> tarball we produce locally by cloning the Git repository + creating the
> tarball.

So, my position on git repositories: we stop asking the forges to
generate a tarball on their side. Instead, we use git the way it has
been designed to be used: we clone the repositories and we generate
the archives locally.

Yes, this is a bold suggestion, and I am aware that this may hurt some
feelings. But let's consider the following:

  - we are doing a git cache now, so only the first downloads are
    penalised; subsequent downloads will be much, much faster [0]

  - the problem is that the dl/ directory is removed by default, which
    is not nice

  - we already have a cache of sorts that is not removed: the ccache is
    located (by default) in the user's home, in ~/.buildroot-ccache/

  - we could change the default for the download directory to be also
    stored in a non-trashed location

  - I would suggest that:

    2. we remove the download and ccache locations options from the
       configuration (they are site-local settings, thye have no place
       in the build configuration)
    1. we change the defaults to: ~/.buildroot/ccache/ and ~/.buildroot/dl/
    3. users can still override each independently with the already
       existing BR2_CCACHE_DIR and BR2_DL_DIR, or a new one to set both,
       BR2_BASE_CACHE_DIR (or whatever) if either is not already set.


Thoughts?

Regards,
Yann E. MORIN.

[0] some corner-cases might be slower, especially when doing a biiig
update-leap to a biiig repository, but even in the case of the Linux
tree it would still be faster to git-fetch new objects than download
a whole new tarball: a github-generated tar.gz for 5.5-rc3 is ~166MiB
(give or take); 166MiB would represent a shitload of new objects in
the repository...

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
