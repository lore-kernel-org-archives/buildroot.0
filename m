From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2020 21:50:50 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: specify
 image to use
In-Reply-To: <20200915193832.291674-1-arnout@mind.be>
References: <20200915193832.291674-1-arnout@mind.be>
Message-ID: <20200915195050.GA2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-09-15 21:38 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Commit 93a2870966 split off the generated gitlab-ci.yml into a child
> pipeline. However, the generated gitlab-ci.yml file no longer had an
> 'image' tag.

Commit 93a2870966 still kept the image tag in the template. The removal
of the iamge tag was done later, see below...

> The result is that the jobs will use whatever image happens
> to be configured on the runner - which leads to frequent pipeline
> failures.

Do you have an example of such a pipeline (and its parent)?

> Fix this by explicitly specifying the image to use (the same one as in
> top-level .gitlab-ci.yml).

I was the one to explicitly remove it, because it is now supposed to be
added bny the script, with commit bef6739094 (gitlab-ci: share the image
version with the child):

    +preamble() {
    +    local template="${1}"
    +
    +    cat - "${template}" <<-_EOF_
    +       # This file is generated; do not edit!
    +       # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
    +
    +       image: ${CI_JOB_IMAGE}
    +
    +_EOF_
    +}

So the preamble is supposed to now contain the image name, the the
template.

And indeed it works for me:

    $ CI_JOB_IMAGE=FOOO support/scripts/generate-gitlab-ci-yml \
        support/misc/gitlab-ci.yml.in
    [...]
    image: FOOO
    [...]

And it looks like the tests I had done were also successfull:

    https://gitlab.com/ymorin/buildroot/-/pipelines/186530918
    https://gitlab.com/ymorin/buildroot/-/jobs/723345502
    https://gitlab.com/ymorin/buildroot/-/jobs/723345502/artifacts/file/generated-gitlab-ci.yml
     -> image: buildroot/base:20200814.2228

And so the jobs in the child pipeline use the expected image:

    https://gitlab.com/ymorin/buildroot/-/pipelines/186531247
    https://gitlab.com/ymorin/buildroot/-/jobs/723346533
     -> Using Docker executor with image buildroot/base:20200814.2228 ...

So, I'm not in favour of restoring the hard-coded version in the child
pipeline.

Regards,
Yann E. MORIN.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/misc/gitlab-ci.yml.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..892eb9ed64 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,3 +1,5 @@
> +image: buildroot/base:20200814.2228
> +
>  .check-DEVELOPERS_base:
>      # get-developers should print just "No action specified"; if it prints
>      # anything else, it's a parse error.
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
