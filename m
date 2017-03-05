From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Mar 2017 23:17:10 +0100
Subject: [Buildroot] [PATCH v3] Add gitlab-CI support
In-Reply-To: <20170305222516.78689464@free-electrons.com>
References: <20170213232303.7053-1-arnout@mind.be>
 <20170305222516.78689464@free-electrons.com>
Message-ID: <a3424329-0e91-9106-9130-e1f7daa9eec9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-03-17 22:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Feb 2017 00:23:03 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> The buildroot repository is now mirrored on
>> https://gitlab.com/buildroot.org/buildroot so we can use Gitlab-CI to
>> test Buildroot. Gitlab-CI is controlled by a .gitlab-ci.yml file
>> that exists in the repository.
> 
> I've applied with some minor changes (see below).
> 
>> Building all the defconfigs takes a long time. Gitlab-CI will do that
>> every time it pulls from git.buildroot.org, which is once per hour.

 Note that I reduced that from once per hour to once per day. Unfortunately I
forgot why I did that :-)

>> That is way too often. Therefore, the defconfigs are not built on pull,
>> but only on explicit trigger through the API or when a tag is added.
> 
> What is the next step now? Who is going to run in a cronjob the thing
> that triggers the build? 

 I think you have better access to machines that can do such a thing, so could
you set it up? Go to the triggers section on
https://gitlab.com/buildroot.org/buildroot/settings/ci_cd, create a trigger
token, and use it in

curl -X POST \
     -F token=TOKEN \
     -F ref=master \
     https://gitlab.com/api/v3/projects/2648174/trigger/builds


> Can we setup a notification on the mailing
> list and/or IRC when there is a failure?

 I would wait a bit with that until any remaining issues on the gitlab side have
been ironed out. One issue I found already is that there seems to be some
throttling going on in the git.freescale.org repositories, and our 12 parallel
freescale defconfigs are hit by it.

 Also, it turns out that the "free runners" have become a lot slower since I
first tried it, it now takes something like a day for all the defconfigs to
build. So maybe we should consider setting up our own runner after all...


 Regards,
 Arnout


>> +    # The container has not package lists, so need to update first
> 
> I've fixed the typo not -> no, as noticed by Marcus.
> 
>> +.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
>> +	(cd configs; ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
> 
> I've added LC_ALL=C when calling ls -1, because I did not had the same
> order as yours when regenerating the list of defconfigs. Apparently,
> depending on the locales armadeus is before or after arm_.
> 
> And I've regenerated the list of defconfigs before pushing, of course.
> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
