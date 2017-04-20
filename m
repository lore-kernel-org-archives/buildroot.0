From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 20 Apr 2017 03:56:48 -0300
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
References: <CAAXf6LXga+ixXCgk_+66vMyxxvYnLbZN32-iXrCY76j84e4--w@mail.gmail.com>
Message-ID: <58f85bb0cb8f7_991ae0a6021685@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I have a local patch for the docs for option D, but I will hold it for few more
days to see if we get more input.

On Wed, Apr 19, 2017 at 04:34 PM, Thomas De Schampheleire wrote:

> 2017-04-14 19:14 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>> On 14-04-17 01:44, Ricardo Martincoski wrote:
[snip]
>>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>>    automatic checker for coding style before submitting patches;
>>>    It checks for a subset of the recommendation (e.g. file naming is not
>>>    checked).
>>
>>  For me, option D is great. It can also be added to the checkpackage script.
>>
> 
> I'm not against this either. However, sometimes I feel that pep8 is
> being too pedantic. For example, there is a minimum variable name
> length of 3. However, for regex searches, it is common to use the
> variable 'm' to hold the match, and then use 'if m' or 'm.group(3)' or
> whatever, which I feel is perfectly fine.

It seems more people think like you because pep8 tool does not check for that
specifically (it's a subset from the recommendation), see my tests at the end.

> I haven't used pep8 so don't know if it can be tweaked.

The warnings can be suppressed by type.
pep8 --ignore E302 1.py
But AFAIK it can't be configured i.e. to check for 1 or 3 empty lines instead
of 2. It's "check for 2" or "don't check for empty lines".

> There also exist other tools btw, like flake8, which also check other
> items than style. They too can be useful, but they too can be 'too
> much'.

I haven't used flake8. I installed it after your e-mail.
I usually use pep8 for style, pyflakes for common errors (i.e. unused import),
and pyflakes3 for Python 3 compatibility (i.e. print without parenthesis).

Last year pep8 got renamed to pycodestyle to reduce confusion with PEP8.

So looking at [4] I had a nice surprise ...   
 pycodestyle >= 2.0.0, < 2.1.0
 pyflakes >= 0.8.0, != 1.2.0, != 1.2.1, != 1.2.2, < 1.3.0
 mccabe >= 0.5.0, < 0.6.0
If you use flake8 you already use pep8 = pycodestyle!

The only thing that worries me a bit is this warning from [5]:
"In many ways, Flake8 is tied to the version of Python on which it runs."


Do you (or somebody else) know if it can be a concern in our use case?


Other than that I am OK to adopt PEP8 + flake8 instead of PEP8 + pep8.
Let's call it option E.
E) PEP8 + flake8
Let's see what others think.


Here is the output for all current Python scripts in Buildroot:
$ flake8 --statistics $(find support/ -type f | xargs file | grep Python \
  | sed -e 's,:.*,,g')
4     E101 indentation contains mixed spaces and tabs
2     E122 continuation line missing indentation or outdented
2     E127 continuation line over-indented for visual indent
2     E128 continuation line under-indented for visual indent
1     E129 visually indented line with same indent as next logical line
5     E201 whitespace after '['
7     E202 whitespace before ']'
3     E203 whitespace before ':'
1     E221 multiple spaces before operator
1     E225 missing whitespace around operator
16    E231 missing whitespace after ','
3     E261 at least two spaces before inline comment
54    E302 expected 2 blank lines, found 1
12    E305 expected 2 blank lines after class or function definition, found 1
6     E402 module level import not@top of file
41    E501 line too long (80 > 79 characters)
6     E502 the backslash is redundant between brackets
2     E711 comparison to None should be 'if cond is None:'
2     E713 test for membership should be 'not in'
15    F401 'checkpackagelib.ConsecutiveEmptyLines' imported but unused
1     F821 undefined name 'sys'
2     W191 indentation contains tabs
2     W391 blank line at end of file
3     W601 .has_key() is deprecated, use 'in'
Only the F[0-9]* warnings are added compared to pep8 --statistics.

And here some comparison among the output of individual commands:
-----------------------------
$ cat 1.py
import os
a = 1
print "a"

def function1():
    b = 1
$ pep8 1.py 
1.py:5:1: E302 expected 2 blank lines, found 1

$ pep8 --ignore E302 1.py

$ pycodestyle 1.py 
1.py:5:1: E302 expected 2 blank lines, found 1

$ pycodestyle --ignore E302 1.py

$ pyflakes 1.py 
1.py:1: 'os' imported but unused
1.py:6: local variable 'b' is assigned to but never used

$ pyflakes3 1.py 
1.py:3:9: invalid syntax
print "a"
        ^

$ flake8 1.py 
1.py:1:1: F401 'os' imported but unused
1.py:5:1: E302 expected 2 blank lines, found 1
1.py:6:5: F841 local variable 'b' is assigned to but never used

$ flake8 --ignore E302 1.py 
1.py:1:1: F401 'os' imported but unused
1.py:6:5: F841 local variable 'b' is assigned to but never used
-----------------------------

(my original e-mail used [3], so I incremented the number to avoid confusion)
[4] http://flake8.pycqa.org/en/latest/faq.html#why-does-flake8-use-ranges-for-its-dependencies
[5] http://flake8.pycqa.org/en/latest/

Regards,
Ricardo
