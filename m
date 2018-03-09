From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Mar 2018 15:36:16 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: correctly handle license
 dirs in subdirs for .hash files
In-Reply-To: <20180309143043.8287-1-peter@korsgaard.com>
References: <20180309143043.8287-1-peter@korsgaard.com>
Message-ID: <CAGm1_kvDXcEpvNHBqzYR9C1Qu81gD_Jaaj1vtRXyb09A84cZtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Mar 9, 2018 at 3:30 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> create_hash_file() used basename(licensefile) when it writes the entry for
> the license file in the .hash, which is obviously not correct when license
> file is locate in a sub directory.
>
> Instead copy the logic from __create_mk_license() to strip the directory
> prefix from the absolute filename instead.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Good catch.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 2b3188dbf6..b9006ee4f7 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -554,7 +554,7 @@ class BuildrootPackage():
>              hash_line = '{method}\t{digest}  {filename}\n'.format(
>                  method='sha256',
>                  digest=sha256.hexdigest(),
> -                filename=os.path.basename(license_file))
> +                filename=license_file.replace(self.tmp_extract, '')[1:])
>              lines.append(hash_line)
>
>          with open(path_to_hash, 'w') as hash_file:
> --
> 2.11.0
>
