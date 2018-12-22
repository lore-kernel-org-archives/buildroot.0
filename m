From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 22 Dec 2018 22:30:43 +0100
Subject: [Buildroot] [PATCH 1/1] scanpypi: write _SOURCE only when needed
In-Reply-To: <20181222181532.25326-1-asafka7@gmail.com>
References: <20181222181532.25326-1-asafka7@gmail.com>
Message-ID: <CAGm1_ktER+RswzCoPUSvHmYgOKne0OpXH1tNZ1ytVxRnnp7O_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 22, 2018 at 7:15 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> For some packages, there's no need to add the _SOURCE variable,
> since the name of the source file is the same as the name of the package
> (like python-engineio).
> Hence, we'll add it to the .mk file only if needed.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

It was a long requested feature. Thanks.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

> ---
>  utils/scanpypi | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 9335bedee4..a75d696222 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -354,13 +354,14 @@ class BuildrootPackage():
>              version=self.version)
>          lines.append(version_line)
>
> -        targz = self.filename.replace(
> -            self.version,
> -            '$({name}_VERSION)'.format(name=self.mk_name))
> -        targz_line = '{name}_SOURCE = {filename}\n'.format(
> -            name=self.mk_name,
> -            filename=targz)
> -        lines.append(targz_line)
> +        if self.buildroot_name != self.real_name:
> +            targz = self.filename.replace(
> +                self.version,
> +                '$({name}_VERSION)'.format(name=self.mk_name))
> +            targz_line = '{name}_SOURCE = {filename}\n'.format(
> +                name=self.mk_name,
> +                filename=targz)
> +            lines.append(targz_line)
>
>          if self.filename not in self.url:
>              # Sometimes the filename is in the url, sometimes it's not
> --
> 2.19.1
>
