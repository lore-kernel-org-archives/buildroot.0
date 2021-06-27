From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jun 2021 19:34:51 +0200
Subject: [Buildroot] [PATCH 2/2 v4] utils/test-pkg: add gitlab-ci support
In-Reply-To: <20210627180921.0451f43b@windsurf>
References: <cover.1624802988.git.yann.morin.1998@free.fr>
 <ee94227bb16df76d7b866f09d243339fd2a619b0.1624802988.git.yann.morin.1998@free.fr>
 <20210627180921.0451f43b@windsurf>
Message-ID: <20210627173451.GC2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-27 18:09 +0200, Thomas Petazzoni spake thusly:
> On Sun, 27 Jun 2021 16:09:59 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >   - the script that generates the pipline,  uses that list to create one
> >     job for each test.
> > 
> >     This is triggered when the last commit log of the series (HEAD),
> >     contains the 'test-pkg config:' directive all alone on its own line,
> >     followed by a configuration fragment snippet to be used as input to
> >     test-pkg.
> Hm, this is not really trivial to use. It definitely needs some
> documentation somewhere.

Right. Like all the rest of the automatic gitlab suport for branches and
tags! ;-)

Oh, in fact there is a terse, very limited blurb about that in our
manual, hidden away toward the end of 22.7.1:
    https://buildroot.org/downloads/manual/manual.html#_using_the_run_tests_framework

It is still very undocumented overall...

> > +    # Retrieve defconfig for test-pkg from the git commit message (if any)
> > +    echo "$CI_COMMIT_DESCRIPTION" \
> > +        | sed -n '/^test-pkg config:$/,/^$/p' \
> > +        > defconfig.frag
> So what happens with this defconfig.frag file? It is left there after
> the script has executed?

Yes, but this script is only expected to be run by the gitlab-ci infra,
which runs in a container that is trashed afterwards. So anything that
is left after the build and is not listed as an artefact, is lost.

And when debugging localy, it is nice to keep the temporary files to
investigate.

> > +    if [ -s defconfig.frag ]; then
> > +        sed -i 1d defconfig.frag
> > +        if [ ! -s defconfig.frag ]; then
> > +            printf "Empty configuration fragment.\n" >&2; exit 1
> > +        fi
> > +        # Use --all since we expect the user having already pre-tested the new package
> > +        # with the default subset of toolchains.
> > +        do_testpkg=( $( ./utils/test-pkg \
> > +                            --all --list-only \
> > +                            --config-snippet defconfig.frag \
> > +                            --build-dir br-test-pkg \
> Same question about the br-test-pkg directory, it stays there after the
> script has executed?

Yes, but unlike defconfig.frag:

  - br-test-pkg/*/.config are listed as artefact, so they are saved
    before the container exits

  - when the container exits, everything else is lost

> Shouldn't both of these be using a temporary directory?

We don't care about that when running in the gitlab-ci infra, because
everything gets lost after the job is done.

> Note: I am not sure I have understood how the .config files generated
> by test-pkg make their way to the Gitlab builds, so perhaps I'm missing
> something.

They are listed as artefacts, so they are saved before the job in the
parent pipeline ends. Then the jobs in the child pipeline inherit them
via the 'needs' directive, and thus they are extracted for all those
jobs.

Yes, each test job get all the br-test-pkg/*/.config files, even if each
job only uses one. But since the job name is the name of the directory
in which to do the build, each job indeed builds only one configuration.

> > +        (-l|--list-only)
> > +            list_only=1; shift 1
> > +            trace() { printf "${@}" >&2; }
> I find "list-only" to be misleading, because it is not much more than
> listing: it is generating the .config for each test configuration. So
> what about --no-build, or --gen-config-only, or something like that?
> 
> To me --list-only, would really only list, i.e it wouldn't generate
> anything.

Initially, the option was named --generate-only, but this was when
test-pkg itself was generating the yaml fragment (which was not nice at
all). So I renamed it to --list-only, butI was not very happy either...

What about --check-buildable-and-list ? Or --prepare-config-and-list ?
--check-if-buildable-then-list-and-keep-config-file ? I obviously have
no good idea... ;-]

The problem is that it is non-trivial to only list the jobs, because
what we really need as input to test-pkg are:
  - a config snippet
  - a list of toolchain definitions

However, to generate the list of jobs, we need to iterate over all the
bundled toolchains defintions, check that it generates a valid
configuration, and if so, generate a job definiton for that.

So, if we just re-emit the toolchain definition, we also need to save
the config fragment, to re-run test-pkg again in each job, to regenerate
a valid configuration, then build it.

However, after the first step, we already know that the configuration is
valid: we even have a .config file for that configuration, which is all
that we need as an input to Buildroot.

So that's why we only need to save the br-test-pkg/*/.config as artefact
of the parent job, and build those in children jobs.

> > +    if [ -n "${list_file}" ]; then
> > +        # Running in list-only implies keeping the build directories.
> > +        keep=1
> > +    fi
> I'm not sure I like this semantic. Perhaps we should simply rely on the
> user passing -k ? Especially since this feature is most likely only
> going to be used by the generate-gitlab-ci-yml machinery ?

ACK, I was not sure either...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
