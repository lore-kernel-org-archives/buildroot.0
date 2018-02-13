From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Feb 2018 01:12:42 -0200
Subject: [Buildroot] [PATCH 09/14] genrandconfig: fix code style
References: <20180129231258.58dd6879@windsurf.lan>
Message-ID: <5a8257aacb962_5196138d1a44697c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jan 29, 2018 at 08:12 PM, Thomas Petazzoni wrote:

> On Sun, 21 Jan 2018 22:44:37 -0200, Ricardo Martincoski wrote:
[snip]
>>  Alternative solutions would be to isolate the common part of the
>>  strings as a variable and concatenate on the fly the strings (using a
>>  bit more processing):
>>    ...="' + COMMON_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in ...
> 
> Yes, please do this. Or perhaps we could use some regexp, because we
> really don't care about the full URL, but just about the tarball name,
> no?

Regexp would work, but to avoid joining configlines into a string to search in,
I think we should change how the config file is opened in this method:

    with open(configfile) as configf:
        config = configf.read()
...
    if re.search(r'^BR2_PACKAGE_PYTHON_NFC=y$', config, re.M) and not sysinfo.has("bzr"):
        return False
    # The ctng toolchain is affected by PR58854
    if re.search(r'^BR2_PACKAGE_LTTNG_TOOLS=y$', config, re.M) and \
       re.search(r'^BR2_TOOLCHAIN_EXTERNAL_URL=".*armv5-ctng-linux-gnueabi.tar.xz"$', config, re.M):
        return False

Notice all 'if' lines will be changed.


The nice thing about keeping using strings is that configlines is already the
result of readlines(), so a list of strings, therefore each 'if' searches a
string in a list.

    BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
...
    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
        return False
    # The ctng toolchain is affected by PR58854
    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
        return False

We also have this code that takes advantage of configlines being a list:
        configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')

And only the long lines need to be changed.

> 
> But I believe all those warning exceptions are really annoying to have.
> I'd really prefer a smarter solution here.

From the two snippets above I prefer the later.
What do you think? Any of the two, or another solution?

Regards,
Ricardo
