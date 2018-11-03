From: Vitaliy Lotorev <lotorev@gmail.com>
Date: Sat, 3 Nov 2018 23:09:21 +0300
Subject: [Buildroot] [1/5] check-package: fix check of file in current dir
 with -b
Message-ID: <CALi-FuibAQV3amqYvLzSe28-cNPLYvi7xTNmYaAZNhtZHzJTBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo Martincoski,

My comments regarding patch [1].

> always use the absolute path of the file being checked when
> -b was passed. A small drawback is that the warning messages will occupy
> more columns in this case,

For user it would be quite unexpected to see that paths used in
check-package arguments mismatch paths printed in stdout.
I can't think of applications that absolutize paths.
?.g when GCC, flake8, cppcheck find errors/warnings they print file names
as they were passed to binary call.

My current usage of check-package - verify patch on Gerrit and vote back.
But in future I'd like to have an ability to report back each line warning
as a bot comment right on file diff screen.
To do this I neet to construct JSON containing list of {'filename', 'line',
'message'} dicts where 'filename' - file path relative to repo root.
Simplified calls when commit under review is checked out:
files=$(git diff --diff-filter ACMRT --name-only HEAD~)
<path-to-buildroot>/utils/check-package --br2-external $files > errors.log
<convert-to-json> errors.txt > errors.json
<post-comments> errors.json

In case check-package will print absolute paths into errors.log extra logic
will be required to make paths relative back again.

[1] http://patchwork.ozlabs.org/patch/992601/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181103/823adb51/attachment.html>
