From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 11:32:30 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
References: <1476373859-51202-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
Message-ID: <f0edac3b-a4bb-002b-0046-f50d4474595b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 00:50, Arnout Vandecappelle wrote:
> 
> 
> On 13-10-16 17:50, Bryce Ferguson wrote:
>> From: Brandon Maier <brandon.maier@rockwellcollins.com>
>>
>> Shallow clones don't work for downloading SHAs. However it's common to
>> track a tag or branch by the commit SHA so that a branch or tag doesn't
>> unexpectedly change.
>>
>> We can take advantage of this scenario by searching the remote for a ref
>> that it equivalent to our sha, then shallow cloning that ref instead.
>>
>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
>> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
>> ---
>>  support/download/git | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/support/download/git b/support/download/git
>> index 281db61..1c6548d 100755
>> --- a/support/download/git
>> +++ b/support/download/git
>> @@ -55,6 +55,23 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>>      fi
>>  fi
>>  if [ ${git_done} -eq 0 ]; then
>> +    # See if $cset is a sha that maps to a branch, then shallow clone that branch
>> +    equivalent_ref="$(_git ls-remote --heads --tags "'${repo}'" | awk "/^${cset}/{ print \$2; exit }" | sed 's,refs/\(tags\|heads\)/,,')"

 Another thing: with --heads --tags, it will not capture "special refs" like
gerrit's refs/changes/42/242/1, which is a pity. Actually for these special refs
it shouldn't be needed to use a sha1 because gerrit makes sure they really are
immutable (if you update the change the last number will increment, and AFAIK
there is no way to delete it); still it would be nice to support sha1's wherever
they come from.

 Cc'ing Ricardo who was concerned about this.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
