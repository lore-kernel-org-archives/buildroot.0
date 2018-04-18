From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Apr 2018 23:22:15 +0200
Subject: [Buildroot] [PATCH] scanpypi: add support for the new PyPI
 infrastructure
In-Reply-To: <20180418095542.22608-1-yegorslists@googlemail.com>
References: <20180418095542.22608-1-yegorslists@googlemail.com>
Message-ID: <8dcadea4-a60f-6085-2059-394b562addd4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-18 11:55, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> https://pypi.python.org URL has been changed to https://pypi.org.
> 
> Package's JSON object now contains sha256 checksum, so use it
> instead of locally computed one. Change comments in the hash
> file accordingly.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index f03ad0bb64..8a2ae00434 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -153,7 +153,7 @@ class BuildrootPackage():
>          """
>          Fetch a package's metadata from the python package index
>          """
> -        self.metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
> +        self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
>              pkg=self.real_name)
>          try:
>              pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
> @@ -187,7 +187,7 @@ class BuildrootPackage():
>              self.metadata['urls'] = [{
>                  'packagetype': 'sdist',
>                  'url': self.metadata['info']['download_url'],
> -                'md5_digest': None}]
> +                'digests': None}]
>              # In this case, we can't get the name of the downloaded file
>              # from the pypi api, so we need to find it, this should work
>              urlpath = six.moves.urllib.parse.urlparse(
> @@ -208,10 +208,10 @@ class BuildrootPackage():
>              else:
>                  self.used_url = download_url
>                  self.as_string = download.read()
> -                if not download_url['md5_digest']:
> +                if not download_url['digests']['md5']:
>                      break
>                  self.md5_sum = hashlib.md5(self.as_string).hexdigest()
> -                if self.md5_sum == download_url['md5_digest']:
> +                if self.md5_sum == download_url['digests']['md5']:
>                      break
>          else:
>              if download.__class__ == six.moves.urllib.error.HTTPError:
> @@ -529,22 +529,23 @@ class BuildrootPackage():
>          path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
>          print('Creating {filename}...'.format(filename=path_to_hash))
>          lines = []
> -        if self.used_url['md5_digest']:
> -            md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
> +        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:

 If there is a sha256, there is no point adding the md5.

 If there is no sha256 for whatever reason (can this happen?), we don't get any
hash at all...

 So I think this should be (pseudocode):

if self.used_url['digests']['sha256']:
    hash_header = '# sha256 from ...'
    ...
else if self.used_url['digests']['md5']:
    hash_header = '# md5 from {url}, sha256 locally computed\n'
    # original code


 Regards,
 Arnout

> +            hash_header = '# md5, sha256 from {url}\n'.format(
>                  url=self.metadata_url)
> -            lines.append(md5_comment)
> +            lines.append(hash_header)
>              hash_line = '{method}\t{digest}  {filename}\n'.format(
>                  method='md5',
> -                digest=self.used_url['md5_digest'],
> +                digest=self.used_url['digests']['md5'],
> +                filename=self.filename)
> +            lines.append(hash_line)
> +            hash_line = '{method}\t{digest}  {filename}\n'.format(
> +                method='sha256',
> +                digest=self.used_url['digests']['sha256'],
>                  filename=self.filename)
>              lines.append(hash_line)
> -        digest = hashlib.sha256(self.as_string).hexdigest()
> -        hash_line = '{method}\t{digest}  {filename}\n'.format(
> -            method='sha256',
> -            digest=digest,
> -            filename=self.filename)
> -        lines.append(hash_line)
>  
> +        if self.license_files:
> +            lines.append('# Locally computed sha256 checksums\n')
>          for license_file in self.license_files:
>              sha256 = hashlib.sha256()
>              with open(license_file, 'rb') as lic_f:
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
