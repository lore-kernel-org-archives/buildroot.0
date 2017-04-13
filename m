From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 13 Apr 2017 00:03:25 -0300
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies
 a package coding style
References: <20170412094909.66ea1ada@free-electrons.com>
Message-ID: <58eeea7d15ad_5ae111447a8319e8@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Apr 12, 2017 at 04:49 AM, Thomas Petazzoni wrote:

> On Tue, 11 Apr 2017 20:03:06 -0300, Ricardo Martincoski wrote:
> 
>> I am inclined to change to this:
>>  support/scripts/
>>  ...
>>  |-- check-package
>>  |-- checkpackage
>>  |   |-- __init__.py
>>  |   |-- base.py
>>  |   |-- lib.py
>>  |   |-- lib_config.py
>>  |   |-- lib_hash.py
>>  |   |-- lib_mk.py
>>  |   |-- lib_patch.py
>>  |   `-- readme.txt
>>  ...
> 
> Looks good to me. I'm wondering what is best between checkpackage and
> check-packagelib for the folder, but I don't have a strong opinion here.

Maybe checkpackagelib?

The dash needs a bit more code:

import importlib
lib_config = importlib.import_module(".lib_config", "check-packagelib")

instead of

import checkpackagelib.lib_config

Also PEP 8 [1] recommends "[a-z]*" for folders (packages) and "[a-z_]*" for
files (modules).

>> >  - Between every function/method/class, you put two empty lines. The
>> >    Buildroot coding style is generally to have only one empty line.  
>> 
>> Sorry, the series got contaminated by my habit of using pep8 with default
>> options.
> 
> Ah, but then if PEP8 suggests this, perhaps we should follow it? It's
> just that we don't do this anywhere else in Buildroot. Anyway, that's
> really a minor detail.

Indeed a minor detail.
+1 on this, either the PEP 8 recommendation [2] or the pep8 tool [3].

My *personal* reasoning for using both is:
"Some people that wrote much more Python code than me already thought and
discussed about this to came up with this recommendation"
"I am lazy so I use the tool so I don't need to read the recommendation too
often"


In the long run, it would be good to have opinions from others.
How do you prefer handling this?
A) you guys discuss on IRC;
B) new thread on the mailing list;
C) add topic to next dev meeting;

Maybe here is a good starting point (authors and reviewers for past year):

find support/ -type f | xargs file | grep Python | sed -e 's,:.*,,g' \
 | tee /tmp/python-files
git shortlog -s 2016.05.. -- $(cat /tmp/python-files) \
 | sed -e 's,^\s*[0-9]*\s*,,g' | sort -u | tee /tmp/python-authors
git log 2016.05.. -- $(cat /tmp/python-files) \
 | grep -Ei '(reviewed|acked)-by:' | sed 's,.*[bB]y: ,,' | sort -u \
 | sed -e 's,\s[<(].*,,g' -e 's,",,g' | tee /tmp/python-reviewers
grep -f /tmp/python-reviewers -f /tmp/python-authors DEVELOPERS

> Have you seen that http://autobuild.buildroot.net/stats/ has a new
> column "Warnings", which indicates for each package the number of
> check-package warnings reported?

Nice! Thank you for this.

[1] https://www.python.org/dev/peps/pep-0008/#package-and-module-names
[2] https://www.python.org/dev/peps/pep-0008
[3] https://pypi.python.org/pypi/pep8

Regards,
Ricardo
