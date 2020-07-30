From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Thu, 30 Jul 2020 12:55:13 +0000
Subject: [Buildroot] relocate-sdk.sh script broken with latest `file`
Message-ID: <VI1PR02MB593526D19ED1B9615739B922DC710@VI1PR02MB5935.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had some problems with python from a relocatable SDK.
After installation/relocation using the `relocate-sdk.sh`, If I try to 
start python I get the following:

    $ ./python
    ValueError: bad marshal data (unknown type code)

So it seems the *.pyc files from the SDK are invalid, and if I remove them 
manually, python starts ok.

After some debugging I nailed the problem to the `relocate-sdk.sh` script
which seems it alters some of the files from the SDK: it replaces the oldpath with 
the new SDK path.
Using the `file` utility it tries to alter only the "text" files.
But on my machine, Manjaro, with file-5.39, it also alters the pyc files
and renders them useless.
It seems that the `file` utility changed it's behavior in the latests versions [1],
and the `relocate-sdk.sh` script thinks the pyc files are text files.

Comparing the output of two different `file` versions:

    $ file --version
    file-5.39
    $ file -b --mime-type numbers.pyc
    text/x-bytecode.python

On a Debian machine:
    
    $ file --version
    file-5.35
    magic file from /etc/magic:/usr/share/misc/magic
    $ file -b --mime-type numbers.pyc
    application/octet-stream

Best regards
Mircea 

[1] https://github.com/file/file/commit/b1e74cccf696a2e6e0eb616eef83b705bafa9446
