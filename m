From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 27 Feb 2020 16:05:41 +0100
Subject: [Buildroot] Untractably slow CVE checks in support/scripts/pkg-stat
Message-ID: <ac23d55f-c8a5-587d-2c98-5967f3abfa14@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas^2, Yann, and all Buildrooters,

During the FOSDEM2020 developer meeting, we started to work on matching 
Buildroot packages against the NIST Vulnerability Database (NVD) files, 
as to obtain a list of known CVEs affecting our packages.

The first implementation, merged in 
4a157be9efac8ba8888e4972f42eda213077152c, was loading entire nvd files 
one by one (Python's json.load()). While this is the most 
straightforward approach, this was not practical because when loaded 
into their Python representation, these files take up to a few gigabytes 
of memory, and hosts with a modest amount of RAM (4GB or less) were 
OOMing while processing the CVEs.

I therefore introduced the usage of the Python 3rd party module ijson, 
which allows to iterate over a json file in streaming, ie only loading 
one CVE at a time from its json representation. Thomas D.S. confirmed 
that this drastically reduced memory consumption. This modification was 
subsequently merged in 712f81c41cde9d58c750ae2b1617831c0b07ccbd . In the 
commit message, I wrote:

"""
To run the script with these modifications, one should install the ijson 
python package. This can be done with pip: `pip install ijson`. On 
Debian based distributions, this can be done with the apt package 
manager: `apt install python-ijson`.
"""

However, Thomas P. reported that the pkg-stat script now takes very much 
longer to terminate (from a few minutes before the change, to 2h30 (!) 
now). At first, I was puzzled because the same script completes in less 
than 5 minutes on my laptop. Thanks to the help of Yann, I managed to 
isolate the issue into a small Python script, which can be found, along 
with accompanying data files over there: 
https://mypi.cz/0c3af4651d1aefe7335b6f137131424e.tar.gz . On my laptop, 
the 8 different steps in this script run all in less than 1 minute, 
while on Yann's machine, the first one did not even complete in a few 
minutes.

I therefore went to the release notes of ijson 
(https://github.com/ICRAR/ijson/blob/master/CHANGELOG.md#24), and found 
that the version 2.4 introduced huge performance improvements. On my 
laptop, I have ijson-2.6.1, because I installed it via pip, and 
therefore obtained the last version. On the other hand, Yann installed 
it via the apt package manager, which only provides ijson-2.3 (before 
the perf improvement).

=> Thus, I think that the huge slowness we see currently in pkg-stat is 
due to an old ijson version. This can be easily verified with the 
following procedure:

1. Uninstall the version distributed by apt:
    `apt remove python-ijson`
2. Install the latest version with pip:
    `pip install [--user] ijson`
3. Start the pkg-stat script, it should complete in less than 5 minutes.


Kind regards,

Titouan
