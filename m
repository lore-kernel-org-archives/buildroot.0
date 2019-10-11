From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:12:53 +0200
Subject: [Buildroot] [PATCH 1/1] scanpypi: write every license file once
In-Reply-To: <20191008090404.26700-2-asafka7@gmail.com>
References: <20191008090404.26700-1-asafka7@gmail.com>
 <20191008090404.26700-2-asafka7@gmail.com>
Message-ID: <8304e5cc-9b9f-7ec3-11a9-0fdb91d84dae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/10/2019 11:04, Asaf Kahlon wrote:
> On some cases, when the package contains multiple license files
> and some of them from the same type, the scanpypi script will write
> the same license type more than once under _LICENSE.
> Hence, before creating the _LICENSE variable, we'll remove every
> possible duplication.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

 Applied to master, thanks.


> ---
>  utils/scanpypi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 55b3d1e61c..b48eda49aa 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -461,6 +461,7 @@ class BuildrootPackage():
>                        ' likely wrong, please change it if need be'.format(
>                            license=', '.join(licenses)))

 I notice now that there's something wrong here: this is under a condition that
licenses is empty, so this statement makes no sense...

>                  licenses = [self.metadata['info']['license']]
> +            licenses = set(licenses)
>              license_line = '{name}_LICENSE = {license}\n'.format(
>                  name=self.mk_name,
>                  license=', '.join(licenses))
> @@ -473,6 +474,7 @@ class BuildrootPackage():
>                      license_names.append(match.license.id)
>                  else:
>                      license_names.append("FIXME: license id couldn't be detected")
> +            license_names = set(license_names)
>  
>              if len(license_names) > 0:
>                  license_line = ('{name}_LICENSE ='

 We have exactly the same code here (including the line you added) in both
branches of the condition, so I smell a refactoring opportunity!

 Regards,
 Arnout
