From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Apr 2018 09:45:35 +0200
Subject: [Buildroot] [PATCH] scanpypi: add support for the new PyPI
 infrastructure
In-Reply-To: <CAGm1_kvbhepzGM2=a874z44X5HMh0aZH8P83W6uj3QmAyCNDfg@mail.gmail.com>
References: <20180418095542.22608-1-yegorslists@googlemail.com>
 <8dcadea4-a60f-6085-2059-394b562addd4@mind.be>
 <CAGm1_kvbhepzGM2=a874z44X5HMh0aZH8P83W6uj3QmAyCNDfg@mail.gmail.com>
Message-ID: <b066b70b-964b-6aee-e3e4-7af5862bbe2b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-04-18 08:57, Yegor Yefremov wrote:
> Hi Arnout,
> 
> On Wed, Apr 18, 2018 at 11:22 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 18-04-18 11:55, yegorslists at googlemail.com wrote:
>>> From: Yegor Yefremov <yegorslists@googlemail.com>
[snip]
>>> @@ -529,22 +529,23 @@ class BuildrootPackage():
>>>          path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
>>>          print('Creating {filename}...'.format(filename=path_to_hash))
>>>          lines = []
>>> -        if self.used_url['md5_digest']:
>>> -            md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
>>> +        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
>>
>>  If there is a sha256, there is no point adding the md5.
>>
>>  If there is no sha256 for whatever reason (can this happen?), we don't get any
>> hash at all...
>>
>>  So I think this should be (pseudocode):
>>
>> if self.used_url['digests']['sha256']:
>>     hash_header = '# sha256 from ...'
>>     ...
>> else if self.used_url['digests']['md5']:
>>     hash_header = '# md5 from {url}, sha256 locally computed\n'
>>     # original code
> 
> You're right. We don't need md5 at all. And I doubt there are any
> packages without sha256 as those checksums will be calculated and put
> into JSON automatically (at least I believe it is so). I've seen
> sha256 checksum for older package version so it seems to be
> consistent.
> 
> What do you think?

 If usually there is a sha256, just support the sha256. If it is missing then
the md5 can be added manually.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
