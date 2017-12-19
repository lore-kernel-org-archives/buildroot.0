From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 19 Dec 2017 21:32:04 -0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
References: <20171219093614.24bdc185@windsurf>
Message-ID: <5a39a17460729_111111ac5882144b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Dec 19, 2017 at 06:36 AM, Thomas Petazzoni wrote:

> On Mon, 18 Dec 2017 23:56:29 -0200, Ricardo Martincoski wrote:
> 
>> On Mon, Dec 18, 2017 at 06:43 AM, Thomas Petazzoni wrote:
>> 
[snip]
>> > +                if self.filename in [ "./package/x11r7/Config.in",
>> > +                                      "./package/kodi/Config.in" ]:  
>> 
>> The 4 warnings from flake8 already in the file I plan to fix in a series for
>> all flake8 warnings in the tree (those 4 actually adding '# noqa' since
>> check-package uses 'inspect' to know which check functions to run).
>> 
>> But (in the case you stick to this solution, see the other e-mail) could you
>> fix those 2 new warnings?
>> utils/checkpackagelib/lib_config.py:137:38: E201 whitespace after '['
>> utils/checkpackagelib/lib_config.py:138:65: E202 whitespace before ']'
> 
> ACK. I don't use flake8, so I don't notice such warnings. I'll fix and
> resend if we agree that this is the appropriate solution.

Thank you for explaining (in the other e-mail) the reasoning of the special
indentation.


One last thought about the code...

Until now the script can be called passing relative or absolute filenames to
check. These 3 commands have the same result:
$ ./utils/check-package $(find $(readlink -f package) -type f) >/dev/null
$ ./utils/check-package $(find package -type f) >/dev/null
$ ./utils/check-package $(find ./package -type f) >/dev/null

To keep this behavior we could use instead:
                if self.filename.endswith("package/x11r7/Config.in") or \
                   self.filename.endswith("package/kodi/Config.in"):
or its equivalent in one line (it fits in 132).

Regards,
Ricardo
