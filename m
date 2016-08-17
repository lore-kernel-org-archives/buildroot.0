From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 22:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
 archive
In-Reply-To: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
Message-ID: <20160817223928.08eeb43a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 12:10:16 -0700, Benjamin Kamath wrote:
> Attempt to do a remote archive since it shortcuts us past a few steps when
> available. Additionally. if the git server has uploadArchive.allowUnreachable
> set to true, then this method can also work on arbitrary sha1s, offering a huge
> speed advantage over a full clone.
> 
> Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
> ---
>  support/download/git | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 416cd1b..043a6de 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -36,6 +36,15 @@ _git() {
>      eval ${GIT} "${@}"
>  }
>  
> +# Try a remote archive, since it is as fast as a shallow clone and can give us
> +# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
> +# on the remote, this will also work for arbitrary sha1s, and will offer a
> +# considerable speedup over a full clone.
> +printf "Doing remote archive\n"
> +if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} -o ${output} ${cset} 2>&1; then
> +    exit 0
> +fi

Are the tarballs produced using this method reproducible? We need the
tarballs produced here to be reproducible so that we can store hashes
for them in the package .hash file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
