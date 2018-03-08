From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 08 Mar 2018 06:52:49 -0300
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
References: <20180307234144.69fc987b@windsurf>
Message-ID: <5aa107f1781f6_10e4c21b7c488cc@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Mar 07, 2018 at 07:41 PM, Thomas Petazzoni wrote:

> On Wed, 28 Feb 2018 00:03:53 -0300, Ricardo Martincoski wrote:
> 
[snip]
>> As an alternative approach we could first download 2 lists:
>> - all projects for distro (now 10, eventually 2000+)
>> - all projects (now 16000+)
>> It could even be saved to a file by one option and then loaded by other option
>> to speedup the development/maintenance.
> 
> Yes, I'll do something like this: download both files to some
> ~/.release-monitoring-all-packages.cache and
> ~/.release-monitoring-buildroot-packages.cache, and use them if they
> already exist. Then an option such as -r/--reload can force pkg-stats
> to re-download the new version.

Sounds good.

[snip]
>> And be aware: it produces few different guesses (some better, some worst).
> 
> I didn't understand this part. Why would the results be different ?

Indeed, it shouldn't.

I am not sure why it does. It only happens for packages that have more than one
project with the exact same name. So we choose one guess over another.

You can check using this:

import json
import os
import subprocess
def print_id(list):
    for i in list['projects']:
        if i['name'] == 'readline':
            print(i['id'])
API = "http://release-monitoring.org/api"
url1 = os.path.join(API, "projects", "?pattern=%s" % 'readline')
url2 = os.path.join(API, "projects")
subprocess.call(['wget', '-O', 'readline', url1])
subprocess.call(['wget', '-O', 'projects', url2])
print_id(json.load(open('readline')))
print_id(json.load(open('projects')))

It gives to me most of times (3 out 4):
913
4173
4173
913
sometimes it gives me (1 out 4):
913
4173
913
4173
It seems to not always return the same order. If I run the above script few
times in a row the order is consistent. If I wait few hours the result can
change.

> 
>> > +    if pkg.latest_version[0]:
>> > +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
>> > +    else:
>> > +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"  
>> 
>> If you don't think it gets too ugly, you could invert the text, putting
>> 'mapping'/'no mapping' as the first cell text. It should make sorting by this
>> column to show all 'mapping' together and 'no mapping' together. I did not
>> tested this.
> 
> I understand the point, but I find it a bit ugly that this information
> appears first in this cell. One option is to make this a separate
> column, but we already have a lot of columns. Can we handle that later
> on ?

Sure.

Regards,
Ricardo
