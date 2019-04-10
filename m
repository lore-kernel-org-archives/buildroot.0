From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Apr 2019 21:50:28 +0200
Subject: [Buildroot] [PATCH 1/1] .flake8: fix check for 80/132 columns
In-Reply-To: <f9471102-712c-1dc9-a506-7bba31aa1fbd@mind.be>
References: <20190409001729.3422-1-ricardo.martincoski@gmail.com>
 <f9471102-712c-1dc9-a506-7bba31aa1fbd@mind.be>
Message-ID: <20190410195028.GJ23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-10 12:33 +0200, Arnout Vandecappelle spake thusly:
> On 09/04/2019 02:17, Ricardo Martincoski wrote:
> > We recommend wrapping at 80 columns but we accept 132 columns when it
> > makes more readable.
> > 
> > When running flake8 locally, use maximum line length 80.
> > But when running in GitLab CI, keep the check-flake8 job failing only
> > for lines longer than 132.
> > 
> > Reported-by: Arnout Vandecappelle <arnout@mind.be>
> > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> 
>  Applied to master, thanks.

You seemed to have missed my comment where I said that was not so good
an idea; if you noticed, you could have at least dismissed it here.

So, why don't I think it is a good idea to differentiate the pipeline
from the local checks?

If contributors pass the checks locally, they'll notice the error
report, and fix the code so that there is no error. Thus, there is no
reason to make the pipeline more lenient about the checks.

If the contributor is allowed to ignore an error reported by the check,
on the assumption that the pipleine is more lenient about it, it means
they will just always ignore errors reported locally (if they even run
the check to start with) and wait for the pipeline to spit actual
errors before fixing them, if at all, in which case another contoibutor
who does run the checks will be polluted by errors others should have
noticed.

So, I still think this was a bad idea to differentiate the two.

Regards,
Yann E. MORIN.

>  My flake8 finds a lot of errors that the one it gitlab-ci doesn't find:
> 
> 3     E112 expected an indented block
> 2     E113 unexpected indentation
> 2     E116 unexpected indentation (comment)
> 25    E122 continuation line missing indentation or outdented
> 1     E201 whitespace after '['
> 2     E202 whitespace before ']'
> 1     E203 whitespace before ':'
> 6     E225 missing whitespace around operator
> 2     E227 missing whitespace around bitwise or shift operator
> 1     E261 at least two spaces before inline comment
> 1     E301 expected 1 blank line, found 0
> 49    E302 expected 2 blank lines, found 1
> 4     E305 expected 2 blank lines after class or function definition, found 1
> 2     E711 comparison to None should be 'if cond is None:'
> 5     E741 ambiguous variable name 'l'
> 1     E902 IndentationError: unindent does not match any outer indentation level
> 3     E999 IndentationError: expected an indented block
> 3     F401 'sys' imported but unused
> 3     W391 blank line at end of file
> 126   W605 invalid escape sequence '\+'
> 
>  But that's of course an entirely different concern.
> 
>  Regards,
>  Arnout
> 
> > ---
> > The result of check-flake8 does not change:
> > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/192997289
> > ---
> >  .flake8           | 2 +-
> >  .gitlab-ci.yml    | 2 +-
> >  .gitlab-ci.yml.in | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/.flake8 b/.flake8
> > index 7dd7b541cc..ee3d5035a0 100644
> > --- a/.flake8
> > +++ b/.flake8
> > @@ -2,4 +2,4 @@
> >  exclude=
> >      # copied from the kernel sources
> >      utils/diffconfig
> > -max-line-length=132
> > +max-line-length=80
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 572868a557..e62e1c3e38 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -38,7 +38,7 @@ check-flake8:
> >          - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
> >          - sort -u files.txt | tee files.processed
> >      script:
> > -        - python -m flake8 --statistics --count $(cat files.processed)
> > +        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
> >      after_script:
> >          - wc -l files.processed
> >  
> > diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> > index a506840892..b1ec671867 100644
> > --- a/.gitlab-ci.yml.in
> > +++ b/.gitlab-ci.yml.in
> > @@ -38,7 +38,7 @@ check-flake8:
> >          - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
> >          - sort -u files.txt | tee files.processed
> >      script:
> > -        - python -m flake8 --statistics --count $(cat files.processed)
> > +        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
> >      after_script:
> >          - wc -l files.processed
> >  
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
