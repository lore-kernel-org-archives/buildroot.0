From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 4 Apr 2016 19:09:53 +0000 (UTC)
Subject: [Buildroot] Project configuration management
References: <24791852-D548-43A1-8E3D-C39D69F479BB@vestiacom.com>
Message-ID: <ndue61$oov$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-04-04, Mateusz S?upny <mateusz.slupny@vestiacom.com> wrote:

> We are using buildroot for building a series of projects. What I
> feel is missing in buildroot is a way to store different
> configurations in scope of a single project. For example, we would
> like to prepare three types of builds, let's name them "Release",
> that is the basic build, "Develop", that is a Release build +
> dropbear + some other utilities, and "Extra", that contains all
> configuration options from Develop + some additional tools (gdb,
> valgrind, etc.). To achieve that, we have to maintain total of
> (number of projects) x (number of build types) different
> configuration files that are almost identical.

To address this issue, I use a single default config file for the
project, and then a build shell script that makes modifications to the
.config file for each "build type":

# bash functions used to manipulate linux kernel-style .config
# files.

function SyncConfig()
{
    yes '' | $Make oldconfig >/dev/null
}

function UnsetValue()
{
    dosync=y
    test "$1" = '-n' && { dosync=n; shift; }
    Variable="$1"
    echo "UnsetValue $Variable"
    sed -i "s/^${Variable}=.*/# ${Variable} is not set/g" .config
    test $dosync = y && SyncConfig
    return 0
}

function SetValue()
{
    dosync=y
    test "$1" = '-n' && { dosync=n; shift; }
    Variable="$1"
    # default value is 'y'
    Value="${2-y}"
    echo "SetValue $Variable $Value"
    # if value isn't 'y', then put it in double quotes
    test "$Value" != y && Value="\"$Value\""
    # escape any slashes
    Value=${Value//\//\\\/}
    sed -i "s/^${Variable}=.*/${Variable}=${Value}/g" .config
    sed -i "s/^# ${Variable} is not set.*/${Variable}=${Value}/g" .config
    test $dosync = y && SyncConfig
    return 0
}


-- 
Grant Edwards               grant.b.edwards        Yow! It's a lot of fun
                                  at               being alive ... I wonder if
                              gmail.com            my bed is made?!?
