From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 19 Apr 2018 08:57:30 +0200
Subject: [Buildroot] [PATCH] scanpypi: add support for the new PyPI
 infrastructure
In-Reply-To: <8dcadea4-a60f-6085-2059-394b562addd4@mind.be>
References: <20180418095542.22608-1-yegorslists@googlemail.com>
 <8dcadea4-a60f-6085-2059-394b562addd4@mind.be>
Message-ID: <CAGm1_kvbhepzGM2=a874z44X5HMh0aZH8P83W6uj3QmAyCNDfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 18, 2018 at 11:22 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 18-04-18 11:55, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> https://pypi.python.org URL has been changed to https://pypi.org.
>>
>> Package's JSON object now contains sha256 checksum, so use it
>> instead of locally computed one. Change comments in the hash
>> file accordingly.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  utils/scanpypi | 29 +++++++++++++++--------------
>>  1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/utils/scanpypi b/utils/scanpypi
>> index f03ad0bb64..8a2ae00434 100755
>> --- a/utils/scanpypi
>> +++ b/utils/scanpypi
>> @@ -153,7 +153,7 @@ class BuildrootPackage():
>>          """
>>          Fetch a package's metadata from the python package index
>>          """
>> -        self.metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
>> +        self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
>>              pkg=self.real_name)
>>          try:
>>              pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
>> @@ -187,7 +187,7 @@ class BuildrootPackage():
>>              self.metadata['urls'] = [{
>>                  'packagetype': 'sdist',
>>                  'url': self.metadata['info']['download_url'],
>> -                'md5_digest': None}]
>> +                'digests': None}]
>>              # In this case, we can't get the name of the downloaded file
>>              # from the pypi api, so we need to find it, this should work
>>              urlpath = six.moves.urllib.parse.urlparse(
>> @@ -208,10 +208,10 @@ class BuildrootPackage():
>>              else:
>>                  self.used_url = download_url
>>                  self.as_string = download.read()
>> -                if not download_url['md5_digest']:
>> +                if not download_url['digests']['md5']:
>>                      break
>>                  self.md5_sum = hashlib.md5(self.as_string).hexdigest()
>> -                if self.md5_sum == download_url['md5_digest']:
>> +                if self.md5_sum == download_url['digests']['md5']:
>>                      break
>>          else:
>>              if download.__class__ == six.moves.urllib.error.HTTPError:
>> @@ -529,22 +529,23 @@ class BuildrootPackage():
>>          path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
>>          print('Creating {filename}...'.format(filename=path_to_hash))
>>          lines = []
>> -        if self.used_url['md5_digest']:
>> -            md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
>> +        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
>
>  If there is a sha256, there is no point adding the md5.
>
>  If there is no sha256 for whatever reason (can this happen?), we don't get any
> hash at all...
>
>  So I think this should be (pseudocode):
>
> if self.used_url['digests']['sha256']:
>     hash_header = '# sha256 from ...'
>     ...
> else if self.used_url['digests']['md5']:
>     hash_header = '# md5 from {url}, sha256 locally computed\n'
>     # original code

You're right. We don't need md5 at all. And I doubt there are any
packages without sha256 as those checksums will be calculated and put
into JSON automatically (at least I believe it is so). I've seen
sha256 checksum for older package version so it seems to be
consistent.

What do you think?

Yegor
