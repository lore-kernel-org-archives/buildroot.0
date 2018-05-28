From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 28 May 2018 00:00:43 -0300
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
References: <20180527164213.GD2965@scaer>
Message-ID: <5b0b70db274a6_4fb02aaaf272e0a857980@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all: I don't think we need to hurry to fix it in the master branch.
The release is so close. Unless of course we need to generate a new docker
image right now for some reason.
Do you disagree?

On Sun, May 27, 2018 at 01:42 PM, Yann E. MORIN wrote:

> On 2018-03-13 00:09 -0300, Ricardo Martincoski spake thusly:
>> Use the latest version of the tool because it is actively maintained.
>> But use a fixed version of the tool and its dependencies to get stable
>> results. It can be manually bumped from time to time.
> [--SNIP--]
>> +# For check-flake8
>> +RUN python -m pip install --upgrade pip setuptools wheel && \
> 
> So, back when you submnitted this patch, I ACKed it. But I missed that
> this command really means we can't reproduce the docker file, because it
> will use versions of pip, setuptools, and wheel that are current at the
> time the command is run.
> 
> I.e. today I could very well get something that is different from the
> version we got back at 20180205.0730 when we last built the docker
> image.
> 
> This is not really nice... :-(

You are correct. Sorry I missed it too.

And this is not the whole problem...
I fixed the version of the direct dependencies of flake8.
But a better approach for the general case would be to fix all versions, as
dependencies between Python packages can include ranges:
package foo 1.0 can depend on bar >= 1.1

> Do you think we could get away without running this command at all, and
> just run the pip-install one, below, since we force the version of the
> modules we isntall?

No. But certainly we can come up with some command that generates reproducible
images.

By trying to install packages without that line we would get errors [1] and [2].
The only version that we don't *need* to upgrade is pip. apt-get installs 9.0.1,
and the pip --upgrade installed version 9.0.2 at the time the current image was
generated.
An image generated today would have pip 10.0.1, demonstrating the problem you
found in the current Dockerfile.

Using 'pip freeze' and 'pip list' inside the current image we can dump all the
current package versions [3].
Since the list of packages to install will become longer we could even move it
to a separate file, as suggested in [4] and also in the example (but not the
text) from the 'Best practices' guide which url you shared a while ago [5].

So a way to generate an image equivalent to the current one would be:

@ support/docker/Dockerfile:
# For check-flake8
COPY requirements.txt /tmp/
RUN pip install -q \
        pip==9.0.2 \
        setuptools==39.0.1 \
        wheel==0.30.0 && \
    pip install -q -r /tmp/requirements.txt

@ support/docker/requirements.txt
bzr==2.8.0.dev1
configobj==5.0.6
configparser==3.5.0
enum34==1.1.6
flake8==3.5.0
mccabe==0.6.1
mercurial==4.0
nose2==0.6.5
pexpect==4.2.1
ptyprocess==0.5.1
pycodestyle==2.3.1
pyflakes==1.6.0
six==1.10.0

And maybe a comment at the first line of the new file would be nice:
# output from 'pip freeze'

What do you think about this approach?
Are you preparing a patch?


[1] error message without setuptools and wheel:
Collecting configparser; python_version < "3.2" (from flake8==3.5.0)
  Using cached https://files.pythonhosted.org/packages/7c/69/c2ce7e91c89dc073eb1aa74c0621c3eefbffe8216b3f9af9d3885265c01c/configparser-3.5.0.t
ar.gz
    Complete output from command python setup.py egg_info:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ImportError: No module named setuptools

[2] error message with setuptools but without wheel:
Building wheels for collected packages: configparser
  Running setup.py bdist_wheel for configparser ... error
  Complete output from command /usr/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-HGBa5l/configparser/setup.py';f=get
attr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" bdist_wheel -d /tm
p/tmpAST7T9pip-wheel- --python-tag cp27:
  usage: -c [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
     or: -c --help [cmd1 cmd2 ...]
     or: -c --help-commands
     or: -c cmd --help

  error: invalid command 'bdist_wheel'

[3] versions for python packages used in buildroot/base:20180318.1724 :
br-user at fa92a79b0862:~$ pip freeze
bzr==2.8.0.dev1
configobj==5.0.6
configparser==3.5.0
enum34==1.1.6
flake8==3.5.0
mccabe==0.6.1
mercurial==4.0
nose2==0.6.5
pexpect==4.2.1
ptyprocess==0.5.1
pycodestyle==2.3.1
pyflakes==1.6.0
six==1.10.0
You are using pip version 9.0.2, however version 10.0.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
br-user at fa92a79b0862:~$ pip list --format=columns | grep 'pip\|setuptools\|wheel'
pip          9.0.2
setuptools   39.0.1
wheel        0.30.0

[4] https://unix.stackexchange.com/questions/349227/dockerfile-docker-image-and-reproducible-environment

[5] https://docs.docker.com/v17.09/engine/userguide/eng-image/dockerfile_best-practices/#add-or-copy


Regards,
Ricardo
