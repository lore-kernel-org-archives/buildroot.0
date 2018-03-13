From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Mar 2018 19:15:19 +0100
Subject: [Buildroot] [PATCH v3 6/7] .gitlab-ci.yml: check flake8
In-Reply-To: <1520910585-19097-7-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-7-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180313181519.GC4317@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-03-13 00:09 -0300, Ricardo Martincoski spake thusly:
> Add a test to check Python code style in the whole buildroot tree.
> 
> Search files by type in order to help flake8 to find the Python scripts
> without .py extension. But don't rely only in the output of 'file' as it
> uses heuristics and sometimes it is wrong (specially identifying Python
> files as C++ source for the 'file' version currently in the Docker
> image).
> 
> Include in the output:
>  - the list of Python files processed;
>  - statistics for each kind of warning;
>  - the total number of warnings;
>  - the number of Python files processed.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> BEFORE APPLYING, see this note from Yann:
> Note: this can only be applied _after_ we regenerate the docker image.
> Then we'll have to update the version of the image at the top of the
> gitlab-ci.yml file.

Indeed, so I've marked this patch as "deferred" in patchwork, so it does
not get accidentally applied.

Also, please consider inverting the order of patch 6 and 7: we need
flake8 to succeeds before enabling the automatic check, so we need to
exclude diffconfig first.

Regards,
Yann E. MORIN.

> Changes v2 -> v3:
>   - manually accepted review tag
> 
> Changes v1 -> v2:  (suggested by Yann E. MORIN)
>   - install flake8 to the base docker image (in the previous patch)
> 
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/57046920
> ---
>  .gitlab-ci.yml    | 11 +++++++++++
>  .gitlab-ci.yml.in | 11 +++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f44c3a9..9ad4c5f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -30,6 +30,17 @@ check-DEVELOPERS:
>      script:
>          - "! utils/get-developers | grep -v 'No action specified'"
>  
> +check-flake8:
> +    before_script:
> +        # Help flake8 to find the Python files without .py extension.
> +        - find * -type f -name '*.py' > files.txt
> +        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
> +        - sort -u files.txt | tee files.processed
> +    script:
> +        - python -m flake8 --statistics --count $(cat files.processed)
> +    after_script:
> +        - wc -l files.processed
> +
>  check-package:
>      script:
>          - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> index cb3eb71..95fc025 100644
> --- a/.gitlab-ci.yml.in
> +++ b/.gitlab-ci.yml.in
> @@ -30,6 +30,17 @@ check-DEVELOPERS:
>      script:
>          - "! utils/get-developers | grep -v 'No action specified'"
>  
> +check-flake8:
> +    before_script:
> +        # Help flake8 to find the Python files without .py extension.
> +        - find * -type f -name '*.py' > files.txt
> +        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
> +        - sort -u files.txt | tee files.processed
> +    script:
> +        - python -m flake8 --statistics --count $(cat files.processed)
> +    after_script:
> +        - wc -l files.processed
> +
>  check-package:
>      script:
>          - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
